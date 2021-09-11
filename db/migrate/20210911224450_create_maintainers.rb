class CreateMaintainers < ActiveRecord::Migration[6.0]
  def change
    create_table :maintainers do |t|
      t.string :name
      t.string :phone
      t.string :dni
      t.string :email

      t.timestamps
    end
  end
end
