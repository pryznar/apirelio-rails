# frozen_string_literal: true

require "apirelio"
require "active_support"
require "rails/railtie"
require_relative "rails/version"
require_relative "rails/configuration"
require_relative "rails/middleware"

module Apirelio
  module Rails
    class << self
      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield configuration
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

      def context(env)
        Apirelio::Rack.context(env)
      end
    end
  end
end

require_relative "rails/railtie"
