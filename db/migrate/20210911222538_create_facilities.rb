class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
