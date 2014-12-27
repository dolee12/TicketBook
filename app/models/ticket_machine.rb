class TicketMachine < ActiveRecord::Base
  validates :store_id, :enabled, :ticket_seq, presence: true
  belongs_to :store
  has_many :tickets
end
