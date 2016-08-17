class StakeHolder < ActiveRecord::Base

  has_many :investments
  belongs_to :town
  belongs_to :address, :dependent => :destroy

  accepts_nested_attributes_for :address

  validates :name, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true



  # after_create :add_payment
  #
  # def add_payment
  #   Payment.create(:amount => self.investment.amount,
  #                  :date => self.created_at,
  #                  :stake_holder_id => self.id,
  #                  :town_id => self.town_id,
  #                  :payment_type => 'deposite'
  #   )
  # end
end
