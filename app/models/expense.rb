class Expense < ActiveRecord::Base

  belongs_to :town
  belongs_to :expense_type

  validates :amount, presence: true
  validates :expense_type_id, presence: true
  validates :town_id, presence: true

  after_create :add_payment

  def add_payment
    Payment.create(:amount => self.amount,
                   :date => self.created_at,
                   :expense_id => self.id,
                   :town_id => self.town_id,
                   :payment_type => 'withdraw'
    )
  end


end
