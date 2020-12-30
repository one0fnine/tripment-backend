# frozen_string_literal: true

module Import
  class Procedure < Main
    protected

    def adapter_service
      @adapter_service ||= ::Adapters::Main.new(data)
    end

    def proxy_service
      @proxy_service ||= ::Proxies::Wikipedia.new
    end

    def query_service
      @query_service ||= ::Queries::Procedures::BulkInsert.new(data)
    end
  end
end
