class Store < ActiveRecord::Base
  validates :reg_no, length: {is: 12}
  validates :user_id, :name, :tel, :address, :open_time, :close_time, presence: true
  belongs_to :user
  has_many :ticket_machines
end