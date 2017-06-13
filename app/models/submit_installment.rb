class SubmitInstallment < ActiveRecord::Base

  belongs_to :installment
  belongs_to :town
  belongs_to :customer


  # validates :installment_id, presence: true
  validates :town_id, presence: true
  validates :submit_date, presence: true
  validates :customer_id, presence: true

  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.installment.per_installments_amount,
                    :date => self.submit_date,
                    :customer_id => self.customer_id,
                    :town_id => self.town_id,
                    :payment_type => 'deposite'
    )
  end

end
