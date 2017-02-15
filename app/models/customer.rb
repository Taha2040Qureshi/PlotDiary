class Customer < ActiveRecord::Base
  belongs_to :address, :dependent => :destroy
  belongs_to :plot
  belongs_to :installment, :dependent => :destroy
  belongs_to :town
  has_many :submit_installments

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :installment

  validates :name, presence: true
  validates :f_name, presence: true
  validates :cnic, presence: true
  validates :plot_id, presence: true
  validates :town_id, presence: true

  after_create :set_plot
  after_create :add_payment

  def set_plot
    plot = Plot.find(self.plot_id)
    plot.update_attribute(:status,1)
  end

  def add_payment
    Payment.create(:amount => self.installment.advance_amount,
                   :date => self.created_at,
                   :customer_id => self.id,
                   :town_id => self.town_id,
                   :payment_type => 'deposite',
                   :payment_status => 'advance'
    )
  end
end
