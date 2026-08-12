# frozen_string_literal: true

module Apirelio
  module Rails
    class Middleware
      def initialize(app, configuration = Apirelio::Rails.configuration)
        @configuration = configuration
        @client = Apirelio::Client.new(**configuration.client_options)
        @middleware = Apirelio::Rack::Middleware.new(
          app,
          client: @client,
          include_routes: configuration.include_routes,
          exclude_routes: configuration.exclude_routes,
          customer_resolver: configuration.customer_resolver,
          application_resolver: configuration.application_resolver,
          error_code_resolver: configuration.error_code_resolver,
          metadata_resolver: configuration.metadata_resolver,
          api_version_header: configuration.api_version_header,
          capture_headers: configuration.capture_headers,
          sdk: "rails",
          sdk_version: VERSION
        )
      end

      def call(env)
        @middleware.call(env)
      end

      attr_reader :client
    end
  end
end
