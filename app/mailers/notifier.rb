class Notifier < ActionMailer::Base
	default from: "admin@chayamushka.com"

	def user_verified(user)
		@user = user
		subject = "Chaya Mushka Children's House Preschool Account Verification"
		mail(:to => user.email, :subject => subject)
	end
end