class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 20, null: false
      t.string :phone, limit: 20, null:false
      t.string :passwd, limit: 20, null:false

      t.timestamps
    end
  end
end
