class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validate :admin_user_must_also_be_a_faculty_user

	belongs_to :administrator, :class_name => "User"

	has_secure_password

	def admin_user_must_also_be_a_faculty_user
		if admin && !faculty
			errors.add(:admin, "users must also be Faculty users.")
		end
	end

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