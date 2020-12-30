# frozen_string_literal: true

FactoryBot.define do
  factory :procedure do
    sequence(:name) { |n| "procedure_#{n}" }
  end
end
