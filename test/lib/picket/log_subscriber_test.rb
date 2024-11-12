# frozen_string_literal: true

require "test_helper"
require "active_support/log_subscriber/test_helper"

module Picket
  class LogSubscriberTest < ActiveSupport::TestCase
    include ActiveSupport::LogSubscriber::TestHelper

    def setup
      @subscriber = Picket::LogSubscriber.new
      super
      Picket::LogSubscriber.attach_to :picket, @subscriber
    end

    def teardown
      super
      ActiveSupport::LogSubscriber.log_subscribers.clear
    end

    def set_logger(logger) # rubocop:disable Naming/AccessorMethodName
      # Isolate the logger used by the test subscriber so that we don't change StoredSession.logger globally
      @subscriber.logger = logger
    end
  end
end
