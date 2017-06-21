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
