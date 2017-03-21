class RentHistory < ActiveRecord::Migration[5.0]
  def change
  	create_table :rent_history do |t|
      t.integer :room_id
      t.integer :user_id
      t.date :in
      t.date :out

      t.timestamps
    end
  end
end
