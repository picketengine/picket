# frozen_string_literal: true

require "test_helper"

module Picket
  class ConfigurationTest < ActiveSupport::TestCase
    test "valid with defaults" do
      assert_predicate Picket::Configuration.new, :valid?
    end
  end
end
