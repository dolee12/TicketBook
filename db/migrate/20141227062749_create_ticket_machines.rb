class CreateTicketMachines < ActiveRecord::Migration
  def change
    create_table :ticket_machines do |t|
      t.references :store, index: true, null:false
      t.string :name, null:true
      t.boolean :enabled, default:false, null:false
      t.integer :ticket_seq, default: 0, null:false
      t.timestamps
    end
  end
end
