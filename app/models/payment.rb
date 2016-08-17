class Payment < ActiveRecord::Base
  belongs_to :town

  validates :amount, presence: true
  validates :date, presence: true
  validates :payment_type, presence: true

end
