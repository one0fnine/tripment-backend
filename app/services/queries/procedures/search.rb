# frozen_string_literal: true

module Queries
  module Procedures
    class Search < Main
      def call
        return records unless args

        records
          .where('lower(name) like :name', name: "%#{args}%")
          .order(order_by_similarity)
      end

      private

      attr_reader :name

      def model
        ::Procedure
      end

      def order_by_similarity
        model.sanitize_sql_array([Arel.sql('similarity(lower(name), :name) DESC'), { name: args }])
      end

      def records
        model.all
      end
    end
  end
end
