class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name
      t.string :location
      t.string :contact_name
      t.string :contact_phone
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
