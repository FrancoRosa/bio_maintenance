class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :user_type
      t.integer :maintainer_id
      t.integer :facility_id

      t.timestamps
    end
  end
end
