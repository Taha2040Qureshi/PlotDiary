class Stock < ActiveRecord::Base
  belongs_to :town
  belongs_to :expense

  validates :town_id, presence: true
  validates :name, presence: true

end
