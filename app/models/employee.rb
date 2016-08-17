class Employee < ActiveRecord::Base

  belongs_to :town
  belongs_to :address

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true
  validates :town_id, presence: true
  validates :salary, presence: true
end
