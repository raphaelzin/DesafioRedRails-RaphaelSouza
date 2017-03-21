class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.date :in
      t.date :out
      t.boolean :accepted

      t.timestamps
    end
  end
end
