# frozen_string_literal: true

module Queries
  class Main
    def initialize(args)
      @args = args
    end

    def call
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    private

    attr_reader :args
  end
end
