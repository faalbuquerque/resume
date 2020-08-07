class Experience < ApplicationRecord
  validates :occupation, presence: true
  validates :description_occupation, presence: true
  validates :company, presence: true
  validates :start_experience, presence: true
  validates :end_experience, presence: true
end
