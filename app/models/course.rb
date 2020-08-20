class Course < ApplicationRecord
  validates :name_course, presence: true
  validates :description_course, presence: true
  validates :institution_course, presence: true
  validates :time_course, presence: true
  validates :conclusion_course, presence: true
  validates :start_course, presence: true

  enum conclusion_course: { Cursando: false, Concluido: true }
end
