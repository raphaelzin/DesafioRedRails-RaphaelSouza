class Picture < ApplicationRecord
	belongs_to :room

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
										:default_url => "/images/:style/missing.png",
										:url => "/assets/images/products/:id/:style/:basename.:extension",
										:path => ":rails_root/public/assets/images/products/:id/:style/:basename.:extension"

	validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
