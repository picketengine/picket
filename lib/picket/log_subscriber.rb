# frozen_string_literal: true

module Picket
  # @private
  class LogSubscriber < ActiveSupport::LogSubscriber
    def initialize
      super
      @logger = logger || Picket.logger
    end

    attr_writer :logger

    def logger
      @logger ||= Picket.logger
    end

    private

    def formatted_event(event, operation, **)
      "  [Picket] #{operation} in #{formatted_duration(event)} (#{formatted_payload(**)})"
    end

    def formatted_duration(event)
      format("%.1fms", event.duration)
    end

    def formatted_payload(**attributes)
      attributes.map { |k, v| "#{k}: #{v.inspect}" }.join(" | ")
    end

    ActiveSupport.run_load_hooks(:picket_log_subscriber, self)
  end
end
