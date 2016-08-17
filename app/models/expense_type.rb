class ExpenseType < ActiveRecord::Base

  belongs_to :town

  validates :name, presence: true

end
