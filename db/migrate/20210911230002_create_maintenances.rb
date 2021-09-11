class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.text :observations
      t.text :parts
      t.string :state_before
      t.string :state_after
      t.string :maintenance_type
      t.text :diagnostic
      t.text :activities
      t.references :device, null: false, foreign_key: true
      t.references :maintainer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
