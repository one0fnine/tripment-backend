# frozen_string_literal: true

module Queries
  module Procedures
    class BulkInsert < Main
      def call
        ::Procedure.import data, validate_uniqueness: true, on_duplicate_key_ignore: true
      end
    end
  end
end
