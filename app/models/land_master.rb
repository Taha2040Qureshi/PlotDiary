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

  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.installment.advance_amount,
                   :date => self.created_at,
                   :land_master_id => self.id,
                   :town_id => self.town_id,
                   :payment_type => 'withdraw',
                   :payment_status => 'advance'
    )
  end

end
