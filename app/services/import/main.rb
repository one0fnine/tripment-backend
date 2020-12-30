# frozen_string_literal: true

module Import
  class Main
    def self.call
      new.call
    end

    def call
      fetch_data
      prepare_data
      create_entities
    end

    protected

    def adapter_service
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    def proxy_service
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    def query_service
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    def fetch_data
      @data = proxy_service.call
    end

    def prepare_data
      @data = adapter_service.call
    end

    def create_entities
      query_service.call
    end

    private

    attr_reader :data
  end
end
