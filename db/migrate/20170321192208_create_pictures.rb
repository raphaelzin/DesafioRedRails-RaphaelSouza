class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
    	t.attachment :picture
    	t.references :room, foreign_key: true
      t.string :sub

      t.timestamps
    end
  end
end
