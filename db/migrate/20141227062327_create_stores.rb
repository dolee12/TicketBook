class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user, null:false, index: true
      t.string :reg_no, limit: 12, null: false
      t.string :name, limit: 100, null: false
      t.string :tel, limit: 20, null: false
      t.string :address, null: false
      t.decimal :location, precision: 18, scale: 12
      t.binary :pic, null: true
      t.string :description,null: true
      t.datetime :open_time, null: false
      t.datetime :close_time,null: false

      t.timestamps
    end
  end
end
