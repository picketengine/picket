# frozen_string_literal: true

require "rails"
require "importmap-rails"
require "stimulus-rails"
require "turbo-rails"

require "picket/log_subscriber"

module Picket
  # @private
  class Engine < ::Rails::Engine
    config.picket = ActiveSupport::OrderedOptions.new

    initializer "picket.deprecator", before: :load_environment_config do |app|
      app.deprecators[:picket] = Picket.deprecator
    end

    initializer "picket.inflector" do |_app|
      ActiveSupport::Inflector.inflections(:en) do |inflect|
        inflect.acronym "API"
      end
    end

    initializer "picket.config" do |_app|
      Picket.config.assign_attributes(config.picket.to_h)
    end

    initializer "picket.logger" do
      ActiveSupport.on_load(:picket) { self.logger ||= ::Rails.logger }
      Picket::LogSubscriber.attach_to :picket
    end

    initializer "picket.asset" do |app|
      config.after_initialize do
        next unless app.config.respond_to?(:assets) && app.config.picket.precompile_assets

        app.config.assets.paths << root.join("app/javascript")
        app.config.assets.paths << root.join("vendor/javascript")
        app.config.assets.precompile += %w[picket_manifest]
      end
    end

    initializer "picket.importmap", before: "importmap" do |app|
      next unless app.config.respond_to?(:importmap)

      app.config.importmap.cache_sweepers << root.join("app/javascript")
      app.config.importmap.cache_sweepers << root.join("vendor/javascript")
      app.config.importmap.paths << root.join("config/importmap.rb")
    end

    config.after_initialize do |app|
      # :nocov:
      unless app.config.eager_load
        Picket.config.base_api_controller_class
        Picket.config.base_controller_class
        Picket.config.base_job_class
        Picket.config.base_mailer_class
        Picket.config.base_metal_controller_class
        Picket.config.base_record_class
      end
      # :nocov:

      Picket.config.validate!
    end
  end
end
