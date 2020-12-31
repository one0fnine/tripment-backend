# frozen_string_literal: true

module Api
  module V1
    class ProceduresController < ApplicationController
      before_action :fetch_procedures, only: :reload

      def index
        respond_to do |format|
          format.html
          format.json { render json: serializer_service, status: :ok }
        end
      end

      def reload
        head :accepted
      end

      private

      def fetch_procedures
        ::FetchProceduresJob.perform_later
      end

      def query_service
        @query_service ||= ::Queries::Procedures::Search.new(permitted_params[:name])
      end

      def permitted_params
        return {} unless params.key?(:filter)

        params.required(:filter).permit(:name)
      end

      def serializer_service
        ProcedureSerializer.new(query_service.call).serializable_hash
      end
    end
  end
end
