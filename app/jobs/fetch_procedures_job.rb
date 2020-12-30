# frozen_string_literal: true

class FetchProceduresJob < ApplicationJob
  queue_as :default

  def perform
    Import::Procedure.call
  end
end
