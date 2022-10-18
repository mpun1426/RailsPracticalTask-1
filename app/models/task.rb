class Task < ApplicationRecord
  validates :title, length: {minimum: 1}
  validates :title, length: {maximum: 20}
  validates :start_date, presence: true 
  validates :end_date, presence: true
  validates :memo, length: {maximum: 147}
end