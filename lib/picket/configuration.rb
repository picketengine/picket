# frozen_string_literal: true

module Picket
  class Configuration
    include ActiveModel::Model
    include ActiveModel::Attributes

    # @!attribute base_api_controller_class_name
    #   @return [String] the name of the class to inherit {Picket::ApplicationAPIController} from.
    attribute :base_api_controller_class_name, :string, default: "::ActionController::API"

    # @!attribute base_channel_class_name
    #   @return [String] the name of the class to inherit {Picket::ApplicationChannel} from.
    attribute :base_channel_class_name, :string, default: "::ActionCable::Channel"

    # @!attribute base_controller_class_name
    #  @return [String] the name of the class to inherit {Picket::ApplicationController} from.
    attribute :base_controller_class_name, :string, default: "::ApplicationController"

    # @!attribute base_job_class_name
    #  @return [String] the name of the class to inherit {Picket::ApplicationJob} from.
    attribute :base_job_class_name, :string, default: "::ApplicationJob"

    # @!attribute base_mailer_class_name
    #  @return [String] the name of the class to inherit {Picket::ApplicationMailer} from.
    attribute :base_mailer_class_name, :string, default: "::ApplicationMailer"

    # @!attribute base_metal_controller_class_name
    #  @return [String] the name of the class to inherit {Picket::ApplicationMetalController} from.
    attribute :base_metal_controller_class_name, :string, default: "::ActionController::Metal"

    # @!attribute base_record_class_name
    #  @return [String] the name of the class to inherit {Picket::ApplicationRecord} from.
    attribute :base_record_class_name, :string, default: "::ApplicationRecord"

    validates! :base_channel_class_name, presence: true
    validates! :base_controller_class_name, presence: true
    validates! :base_api_controller_class_name, presence: true
    validates! :base_metal_controller_class_name, presence: true
    validates! :base_job_class_name, presence: true
    validates! :base_mailer_class_name, presence: true
    validates! :base_record_class_name, presence: true

    # @return [Class] the class to inherit {Picket::ApplicationAPIController} from.
    def base_api_controller_class = @base_api_controller_class ||= base_api_controller_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationChannel} from.
    def base_channel_class = @base_channel_class ||= base_channel_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationController} from.
    def base_controller_class = @base_controller_class ||= base_controller_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationJob} from.
    def base_job_class = @base_job_class ||= base_job_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationMailer} from.
    def base_mailer_class = @base_mailer_class ||= base_mailer_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationMetalController} from.
    def base_metal_controller_class = @base_metal_controller_class ||= base_metal_controller_class_name.constantize

    # @return [Class] the class to inherit {Picket::ApplicationRecord} from.
    def base_record_class = @base_record_class ||= base_record_class_name.constantize

    ActiveSupport.run_load_hooks(:picket_configuration, self)
  end
end
