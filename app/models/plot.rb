class Plot < ActiveRecord::Base

  belongs_to :town

  validates :plot_number, presence: true
  validates :plot_number, uniqueness: true
  validates :total_price, presence: true
  validates :area, presence: true
  validates :length, presence: true
  validates :width, presence: true
  validates :street, presence: true
end
