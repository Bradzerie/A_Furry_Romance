class Pet < ApplicationRecord
  SPECIES = ['Dog', 'Cat', 'Rabbit', 'Alpaca', 'Baby Duck', 'Horse', 'Guinea Pig', 'Hamster', 'Tarantula', 'Ferret',
  'Capybara']
  GENDER = ['Male', 'Female']
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :age, :species, :gender, :price, presence: true
  validates :species, inclusion: { in: SPECIES }
  validates :gender, inclusion: { in: GENDER }
end
