class Payment < ActiveRecord::Base
  belongs_to :town
  belongs_to :stake_holder
  belongs_to :land_master

  validates :amount, presence: true
  validates :date, presence: true
  validates :payment_type, presence: true

end
