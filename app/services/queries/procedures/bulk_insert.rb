# frozen_string_literal: true

module Queries
  module Procedures
    class BulkInsert < Main
      def call
        model.import args, validate_uniqueness: true, on_duplicate_key_ignore: true
      end

      private

      attr_reader :data

      def model
        ::Procedure
      end
    end
  end
end
