class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :address
      t.string :desc
      t.integer :guests
      t.integer :beds
      t.float :price
      t.references :user, foreign_key: true
      t.boolean :available

      t.timestamps
    end
  end
end
