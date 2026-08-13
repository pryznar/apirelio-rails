# Apirelio quickstart

This is the smallest integration path for the package. It uses the synthetic customer `customer_42`; replace that resolver with your authenticated account lookup before production.

```bash
export APIRELIO_API_KEY=apr_live_your_project_key
rails new demo --api && cd demo && bundle add apirelio-rails
```

Copy `config-initializers-apirelio.rb` to `config/initializers/apirelio.rb` and `config-routes.rb` to `config/routes.rb`, then run `bin/rails server`.

Generate one request to the example endpoint, wait for the asynchronous batch to flush, then open the [live demo](https://apirelio.com/demo?utm_source=github&utm_medium=example&utm_campaign=rails) to understand the resulting customer-aware views.

The SDK never captures request or response payloads. Do not put secrets or personal data into customer identity or custom metadata.
