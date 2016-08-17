class GivenInstallment < ActiveRecord::Base
  belongs_to :installment
  belongs_to :town
  belongs_to :land_master


  validates :installment_id, presence: true
  validates :town_id, presence: true
  validates :submit_date, presence: true
  validates :land_master_id, presence: true

  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.installment.installment_type.amount,
                   :date => self.submit_date,
                   :customer_id => self.land_master_id,
                   :town_id => self.town_id,
                   :payment_type => 'withdraw'
    )
  end
end
