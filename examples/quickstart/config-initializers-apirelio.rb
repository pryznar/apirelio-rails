Apirelio::Rails.configure do |config|
  config.api_key = ENV.fetch("APIRELIO_API_KEY", "")
  config.service = "github-quickstart"
  config.environment = "development"
  config.customer_resolver = ->(_env) {
    { id: "customer_42", name: "Acme Europe", plan: "growth" }
  }
end

