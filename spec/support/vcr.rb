# frozen_string_literal: true

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    match_requests_on: %i[method uri],
    record: :none
  }
  c.allow_http_connections_when_no_cassette = false
  c.ignore_localhost = false
  c.preserve_exact_body_bytes do |http_message|
    http_message.is_a?(VCR::Response) && !http_message.body.valid_encoding?
  end
  c.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
  # c.debug_logger = $stderr
end
