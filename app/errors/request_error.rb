# frozen_string_literal: true

class RequestError < StandardError
  def initialize(response)
    @response = response
    @code = response.code
    super
  end

  def message
    "Request error with #{code} status code and #{body} response"
  end

  private

  attr_reader :response, :code

  def connection_error?
    response.timed_out? || response.code.zero? || response.options[:return_code] != :ok
  end

  def body
    connection_error? ? response.return_message : response.body
  end
end
