class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, :company, :category, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.interest_count
    order(:level_of_interest)
    .group(:level_of_interest)
    .count
  end

  def self.location_count
    order(:city)
    .group(:city)
    .count
  end

  def self.top_companies
    joins(:company)
    .group(:name)
    .order("average_level_of_interest DESC")
    .average(:level_of_interest).take(3)
  end
end
