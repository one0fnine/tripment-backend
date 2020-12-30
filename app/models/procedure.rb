# frozen_string_literal: true

class Procedure < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
