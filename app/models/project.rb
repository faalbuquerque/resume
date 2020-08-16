class Project < ApplicationRecord
  validates :name_project, presence: true
  validates :description_project, presence: true
  validates :link_project, presence: true
end
