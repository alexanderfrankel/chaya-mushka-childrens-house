class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	has_secure_password

	def to_s
		if admin?
			"#{last_name}, #{first_name} (Admin)"
		elsif faculty?
			"#{last_name}, #{first_name} (Faculty)"
		else
			"#{last_name}, #{first_name}"
		end
	end
end