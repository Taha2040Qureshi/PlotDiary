class Installment < ActiveRecord::Base

  belongs_to :town

  validates :total_amount, presence: true
  validates :advance_amount, presence: true
  validates :total_number_of_installments, presence: true
  validates :per_installments_amount, presence: true
  validates :installment_type, presence: true

end