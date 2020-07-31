class AcademicInfo < ApplicationRecord
  validates :name_academic, presence: true
  validates :description_academic, presence: true
  validates :institution_academic, presence: true
  validates :conclusion_academic, presence: true
  validates :start_date, presence: true
end
