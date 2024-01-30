class Booking < ApplicationRecord
  STATUS = ['Pending', 'Confirmed', 'Declined']
  belongs_to :pet
  belongs_to :user

  validates :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: STATUS }
end
