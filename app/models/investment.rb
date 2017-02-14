class Investment < ActiveRecord::Base
  belongs_to :town
  belongs_to :stake_holder

  validates :amount, presence: true
  validates  :stake_holder, presence: true

  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.amount,
                   :date => self.created_at,
                   :stake_holder_id => self.stake_holder_id,
                   :town_id => self.town_id,
                   :payment_type => 'deposite'
    )
  end

end
