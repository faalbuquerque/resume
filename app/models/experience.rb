class Experience < ApplicationRecord
  validates :occupation, presence: true
  validates :description_occupation, presence: true
  validates :company, presence: true
  validates :start_experience, presence: true
  validates :check_work, presence: true

  enum check_work: { Sim: 0, Não: 1 }
end
