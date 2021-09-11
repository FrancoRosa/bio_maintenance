class CreateDeviceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :device_types do |t|
      t.string :name
      t.text :protocol

      t.timestamps
    end
  end
end
