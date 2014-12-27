class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true, null:false
      t.references :ticket_machine, index: true, null:false
      t.integer :ticket_no, default: 0, null:false
      t.integer :people_cnt, default: 1, null:false
      t.datetime :check_in, null:true

      t.timestamps
    end
  end
end