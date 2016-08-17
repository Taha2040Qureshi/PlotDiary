class LandMaster < ActiveRecord::Base

  belongs_to :address, :dependent => :destroy
  belongs_to :town
  belongs_to :installment, :dependent => :destroy

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :installment

  validates :name, presence: true
  validates :town_id, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true

end
