class User < ApplicationRecord
	has_secure_password

	attr_accessor :remember_token, :activation_token
	before_save  :downcase_email
	before_create  :create_activation_digest
	before_save { email.downcase! }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: true
	

	 def posts
	    return Post.where(user_id: self.id)
	 end


	 def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token  = User.new_token
      
    end

    def User.new_token
	   SecureRandom.urlsafe_base64
	end
end
