class Ticket < ActiveRecord::Base
  validates :user_id, :ticket_machine_id, :ticket_no, :people_cnt, presence: true
  belongs_to :user
  belongs_to :ticket_machine
end
