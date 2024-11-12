# frozen_string_literal: true

require "test_helper"
require "generators/picket/install/install_generator"

module Picket
  class InstallGeneratorTest < Rails::Generators::TestCase
    tests Picket::InstallGenerator
    destination File.expand_path("../../../../tmp", __dir__)

    setup :prepare_destination
    setup :run_generator

    test "config/initializers/picket.rb exists" do
      assert_file "config/initializers/picket.rb"
    end

    test "config/picket.yml exists" do
      assert_file "config/picket.yml"
    end
  end
end
