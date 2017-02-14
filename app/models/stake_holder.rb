class StakeHolder < ActiveRecord::Base

  has_many :investments
  belongs_to :town
  belongs_to :address, :dependent => :destroy

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true

end
