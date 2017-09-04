class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :company, :category, presence: true
  belongs_to :company
  belongs_to :category
end
