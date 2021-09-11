class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :serial
      t.date :last_maintenance
      t.references :area, null: false, foreign_key: true
      t.references :device_type, null: false, foreign_key: true
      t.references :critical_level, null: false, foreign_key: true

      t.timestamps
    end
  end
end
