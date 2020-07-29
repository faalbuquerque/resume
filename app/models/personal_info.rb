class PersonalInfo < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :fone, presence: true
  validates :email, presence: true
  validates :links, presence: true
  validates :goals, presence: true
end
