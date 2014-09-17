class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validate :admin_user_must_also_be_a_faculty_user

	before_create { generate_token(:auth_token) }

	belongs_to :administrator, :class_name => "User"

	has_secure_password

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def verify_user
		self.verified = true
		save!
		UserMailer.user_verified(self).deliver
	end

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

	def self.find_unverified
		User.where("verified = ?", false)
	end

	def self.find_admin
		User.where("admin = ? AND verified = ?", true, true)
	end

	def self.find_faculty
		User.where("faculty = ? AND admin = ? AND verified = ?", true, false, true)
	end

	def self.find_parent
		User.where("faculty = ? AND verified = ?", false, true)
	end
end