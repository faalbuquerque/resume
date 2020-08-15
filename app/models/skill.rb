class Skill < ApplicationRecord
  validates :name_skill, presence: true
  validates :type_skill, presence: true

  enum type_skill: { Soft: 0, Hard: 1 }
end
