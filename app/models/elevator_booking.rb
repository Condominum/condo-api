# frozen_string_literal: true

class ElevatorBooking < ApplicationRecord
  default_scope { order(start: :desc) }
  belongs_to :user
  validates :start, presence: true
  validates :end, presence: true
  validates :unit, presence: true
  validates :name1, presence: true
end
