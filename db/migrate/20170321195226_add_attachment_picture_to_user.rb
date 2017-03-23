class AddAttachmentPictureToUser < ActiveRecord::Migration[5.0]
    def self.up
    change_table :users do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :users, :picture
  end
end
