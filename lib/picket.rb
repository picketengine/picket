# frozen_string_literal: true

require "picket/version"
require "picket/deprecator"
require "picket/engine"
require "picket/configuration"

module Picket
  # @!attribute [rw] self.config
  #   @return [Picket::Configuration] the configuration instance for Picket.
  mattr_accessor :config, default: Picket::Configuration.new

  # @!attribute [rw] self.logger
  #   @return [ActiveSupport::Logger] the logger to use for Picket.
  mattr_accessor :logger

  # Configures Picket.
  # @yield [config] Yields {Picket.config} to the block.
  # @yieldparam [Picket::Configuration] config the configuration instance.
  def self.configure
    yield config
    validate_config!
  end

  # Validates {Picket.config} and raises an error on any validation failures.
  def self.validate_config!
    config.validate!
  end

  ActiveSupport.run_load_hooks(:picket, self)
end
