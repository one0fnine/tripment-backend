# frozen_string_literal: true

module Proxies
  class Main
    delegate :success?, to: :request

    def call
      execute_request
      response
    end

    protected

    def request_url
      raise ::NotImplementedError, "#{self.class.name}##{__method__} not implemented yet"
    end

    def request_method
      :get
    end

    def request_params; end

    private

    attr_reader :request, :response

    def cache
      Typhoeus::Cache::Rails.new(Rails.cache, default_ttl: 1.minute)
    end

    def client
      Typhoeus::Request.new(request_url, request_options)
    end

    def default_headers
      { 'Content-Type' => 'application/json', 'charset' => 'utf-8' }
    end

    def execute_request
      @request = client.run
      success? ? @response = prepare_response : handle_error
    end

    def handle_error
      raise(::RequestError, request)
    end

    def prepare_response
      Oj.load(request.response_body)
    end

    def request_timeout
      600
    end

    def request_options
      {
        method: request_method,
        headers: default_headers,
        params: request_params,
        timeout: request_timeout,
        cache: cache
      }.compact
    end
  end
end
