# frozen_string_literal: true

module Picket
  class ApplicationRecord < Picket.config.base_record_class
    self.abstract_class = true
  end
end
