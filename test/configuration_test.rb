# frozen_string_literal: true

require_relative "test_helper"

class ConfigurationTest < Minitest::Test
  def setup
    Apirelio::Rails.reset_configuration!
  end

  def test_configures_the_railtie_adapter
    Apirelio::Rails.configure do |config|
      config.api_key = "apr_test"
      config.service = "billing-api"
      config.include_routes = ["/api/**"]
    end

    assert_equal "apr_test", Apirelio::Rails.configuration.api_key
    assert_equal "billing-api", Apirelio::Rails.configuration.service
    assert_equal ["/api/**"], Apirelio::Rails.configuration.include_routes
  end

  def test_middleware_captures_rails_context_and_keeps_the_response
    transport = RecordingTransport.new
    configuration = Apirelio::Rails::Configuration.new
    configuration.api_key = "apr_test"
    configuration.service = "rails-api"
    configuration.environment = "test"
    configuration.transport = transport
    configuration.metadata_keys = ["region"]
    configuration.customer_resolver = ->(env) { { id: env["HTTP_X_CUSTOMER_ID"] } }

    app = lambda do |env|
      env["action_dispatch.route_uri_pattern"] = "/api/accounts/:account_id(.:format)"
      env["action_dispatch.request.path_parameters"] = { controller: "accounts", action: "show" }
      Apirelio::Rails.context(env).add_metadata(region: "eu")
      [200, { "Content-Length" => "2" }, ["ok"]]
    end
    middleware = Apirelio::Rails::Middleware.new(app, configuration)
    response = Rack::MockRequest.new(middleware).get("/api/accounts/42", "HTTP_X_CUSTOMER_ID" => "acme")
    assert_equal 200, response.status
    assert middleware.client.flush

    event = transport.events.first
    assert_equal "/api/accounts/{account_id}", event[:route]
    assert_equal "accounts#show", event[:route_name]
    assert_equal "acme", event[:customer_id]
    assert_equal "rails", event[:sdk]
    assert_equal({ "region" => "eu" }, event[:metadata])
  ensure
    middleware&.client&.shutdown
  end
end
