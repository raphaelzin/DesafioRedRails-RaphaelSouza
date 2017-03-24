class CreateRentHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :rent_histories do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.date :in
      t.date :out

      t.timestamps
    end
  end
end
