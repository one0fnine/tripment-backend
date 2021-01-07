# frozen_string_literal: true

module Queries
  module Procedures
    class Search < Main
      def call
        Rails.cache.fetch("procedures/#{cache_key_with_version}", expires_in: 15.minutes) do
          args.blank? ? records : filtered_records
        end
      end

      private

      attr_reader :name

      def cache_key_with_version
        args.to_s.hash
      end

      def filtered_records
        records
          .where('lower(name) like :name', name: "%#{args.downcase}%")
          .order(order_by_similarity)
      end

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
