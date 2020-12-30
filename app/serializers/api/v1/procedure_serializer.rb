# frozen_string_literal: true

module Api
  module V1
    class ProcedureSerializer
      include JSONAPI::Serializer

      attributes :id, :name
    end
  end
end
