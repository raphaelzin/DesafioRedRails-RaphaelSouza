class User < ApplicationRecord
	has_secure_password

	before_save { self.email = email.downcase }

	has_many :rooms, :dependent => :destroy

	has_many :wishes
	has_many :rent_histories
	
	# Na pagina dos usuários do airb nb os comentários são sobre os quartos
	has_many :comments, :through => :rooms
	has_many :requests, :through => :rooms

	# Validação
	validates :name, presence: true
	validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

	has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>", xs: "50x50>" },
	 :default_url => ActionController::Base.helpers.asset_path('default-avatar.png')
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
