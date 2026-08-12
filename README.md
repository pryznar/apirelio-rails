# Apirelio Rails

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
