class Town < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :address, :dependent => :destroy

  has_many :expenses
  has_many :users
  has_many :customers
  has_many :employees
  has_many :installments
  has_many :land_masters
  has_many :payments
  has_many :plots
  has_many :stake_holders
  has_many :expense_types
  has_many :installment_types
  has_many :investments
  has_many :submit_installments
  has_many :given_installments
  has_many :stocks


  accepts_nested_attributes_for :address

end
