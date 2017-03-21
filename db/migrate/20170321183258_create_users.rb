class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :desc
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
