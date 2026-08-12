# frozen_string_literal: true

module Apirelio
  module Rails
    class Configuration
      attr_accessor :api_key, :service, :endpoint, :environment, :release, :enabled,
                    :batch_size, :flush_interval, :max_queue_size, :timeout, :max_retries,
                    :metadata_keys, :include_routes, :exclude_routes, :customer_resolver,
                    :application_resolver, :error_code_resolver, :metadata_resolver,
                    :api_version_header, :capture_headers, :transport

      def initialize
        @api_key = ENV.fetch("APIRELIO_API_KEY", "")
        @service = ENV.fetch("APIRELIO_SERVICE", "rails-api")
        @endpoint = ENV.fetch("APIRELIO_ENDPOINT", "https://apirelio.com")
        @environment = ENV.fetch("RAILS_ENV", "production")
        @release = ENV["APIRELIO_RELEASE"]
        @enabled = true
        @batch_size = 100
        @flush_interval = 5.0
        @max_queue_size = 10_000
        @timeout = 2.0
        @max_retries = 2
        @metadata_keys = []
        @include_routes = []
        @exclude_routes = []
        @customer_resolver = nil
        @application_resolver = nil
        @error_code_resolver = nil
        @metadata_resolver = nil
        @api_version_header = "HTTP_X_API_VERSION"
        @capture_headers = %w[HTTP_X_SDK_VERSION HTTP_USER_AGENT]
        @transport = nil
      end

      def client_options
        {
          api_key: api_key,
          service: service,
          endpoint: endpoint,
          environment: environment,
          release: release,
          enabled: enabled,
          batch_size: batch_size,
          flush_interval: flush_interval,
          max_queue_size: max_queue_size,
          timeout: timeout,
          max_retries: max_retries,
          metadata_keys: metadata_keys,
          transport: transport
        }
      end
    end
  end
end
