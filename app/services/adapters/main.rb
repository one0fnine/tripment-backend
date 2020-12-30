# frozen_string_literal: true

module Adapters
  class Main
    def initialize(data)
      @data = data || {}
    end

    def call
      decorate_data prepare_data
    end

    protected

    def decorate_data(prepared_data)
      return [] if prepared_data.blank?

      prepared_data.keep_if { _1['ns'].to_i.zero? }.map! { { name: _1['*'] } }
    end

    def prepare_data
      data.dig('parse', 'links') || []
    end

    private

    attr_reader :data
  end
end
