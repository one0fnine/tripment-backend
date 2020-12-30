# frozen_string_literal: true

namespace :procedures do
  desc 'update procedures'
  task update: :environment do
    Import::Procedure.call
  end
end
