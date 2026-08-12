# frozen_string_literal: true

module Apirelio
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "apirelio.middleware" do |app|
        app.middleware.use Apirelio::Rails::Middleware, Apirelio::Rails.configuration
      end
    end
  end
end
