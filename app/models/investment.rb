class Investment < ActiveRecord::Base
  belongs_to :town
  belongs_to :stake_holder

  validates :amount, presence: true

end
