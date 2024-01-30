class Pet < ApplicationRecord
  SPECIES = ['Dog', 'Cat', 'Rabbit', 'Alpaca', 'Baby Duck', 'Horse', 'Guinea Pig', 'Hamster', 'Tarantula', 'Ferret']
  GENDER = ['Male', 'Female']
  belongs_to :user

  validates :name, :age, :species, :gender, :price, presence: true
  validates :species, inclusion: { in: SPECIES }
  validates :gender, inclusion: { in: GENDER }
end
