# frozen_string_literal: true

module Picket
  # @private
  def self.deprecator
    @deprecator ||= ActiveSupport::Deprecation.new
  end
end
