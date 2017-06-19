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

  def self.daily(date = Time.now.utc.to_date)
    where(['created_at >= ? AND created_at < ?', date, date + 1])
  end

  def self.weekly(date= Time.now.utc.to_date)
    where(['created_at >= ? AND created_at <= ?', date.beginning_of_week, date.end_of_week])
  end

end
