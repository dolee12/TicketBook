class CreateStoreTicketMachines < ActiveRecord::Migration
  def change
    create_table :store_ticket_machines do |t|
      t.references :store, index:true, null:false
      t.references :machine, index:true, null:false

      t.timestamps
    end
  end
end
