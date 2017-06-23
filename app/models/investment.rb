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

  def self.daily(date = Time.now.utc.to_date)
    where(['created_at >= ? AND created_at < ?', date, date + 1])
  end

  def self.weekly(date= Time.now.utc.to_date)
    where(['created_at >= ? AND created_at <= ?', date.beginning_of_week, date.end_of_week])
  end

  def self.monthly(date= Time.now.utc.to_date)
    where(['created_at >= ? AND created_at <= ?', date.beginning_of_month, date.end_of_month])
  end

end
