# Apirelio Rails

[![RubyGems](https://img.shields.io/gem/v/apirelio-rails?style=flat-square&logo=rubygems)](https://rubygems.org/gems/apirelio-rails)
[![Live demo](https://img.shields.io/badge/live_demo-explore-8EF0B5?style=flat-square&logo=googlechrome&logoColor=0B0E10)](https://apirelio.com/demo?utm_source=github&utm_medium=readme&utm_campaign=rails)

## See the customer behind every API request

[![Apirelio live demo dashboard](https://apirelio.com/img/apirelio-live-demo-dashboard.jpg)](https://apirelio.com/demo?utm_source=github&utm_medium=readme&utm_campaign=rails)

Follow a release regression from the failing endpoint to the exact customer accounts it affects in the public, read-only workspace.

**[Explore the live demo →](https://apirelio.com/demo?utm_source=github&utm_medium=readme&utm_campaign=rails)**

## Try it in 30 seconds

```bash
bundle add apirelio-rails
export APIRELIO_API_KEY=apr_live_your_project_key
```

Copy the minimal setup below or run the [quickstart example](./examples/quickstart). Delivery is fail-safe and no request or response payloads are captured.


[Documentation](https://apirelio.com/docs/ruby/rails) · [RubyGems](https://rubygems.org/gems/apirelio-rails) · [Apirelio](https://apirelio.com)

Automatic customer-aware API analytics for Rails 7.1 and 8.x.

```bash
bundle add apirelio-rails
```

```ruby
# config/initializers/apirelio.rb
Apirelio::Rails.configure do |config|
  config.api_key = ENV.fetch("APIRELIO_API_KEY", "")
  config.service = "billing-api"
  config.customer_resolver = ->(env) {
    account = env["current_account"]
    account && { id: account.id.to_s, name: account.name, plan: account.plan }
  }
end
```

The Railtie registers middleware automatically. It records matched Rails routes, controller actions, status, duration and stable customer/application identity. Bodies, query strings, credentials, cookies and client IP addresses are never captured.
