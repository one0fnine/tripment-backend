# frozen_string_literal: true

module Proxies
  class Wikipedia < Main
    protected

    def request_params
      {
        action: 'parse',
        page: 'Medical_procedure',
        format: 'json',
        section: 2,
        prop: 'links'
      }
    end

    def request_url
      'https://en.wikipedia.org/w/api.php'
    end
  end
end
