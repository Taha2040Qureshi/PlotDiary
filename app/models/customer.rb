class Customer < ActiveRecord::Base
  belongs_to :address, :dependent => :destroy
  belongs_to :plot
  belongs_to :installment, :dependent => :destroy
  belongs_to :town
  has_many :submit_installments

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :installment

  validates :name, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true
  validates :plot_id, presence: true
  validates :town_id, presence: true

end
