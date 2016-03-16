class User < ActiveRecord::Base

validates :username, presence: true, length: { within: 6..20}, 
							uniqueness: { case_sensitive: false }
has_secure_password
PASSWORD_REGEX = /\A(?=.*\d)(?=.*[a-zA-Z])[A-Za-z\d]+\z/

validates :password, presence: true, length: { within: 6..16 },
							 format: { with: PASSWORD_REGEX }
def User.digest(string)
	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
end                                              
end
