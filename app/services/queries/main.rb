# frozen_string_literal: true

module Queries
  class Main
    def initialize(data)
      @data = data
    end

    def call
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    private

    attr_reader :data
  end
end
