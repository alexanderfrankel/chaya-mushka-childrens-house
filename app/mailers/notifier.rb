class Notifier < ActionMailer::Base
	from_address = ActionMailer::Base.smtp_settings[:user_name]
	default from: "Chaya Mushka App <#{from_address}>"

	def user_verified(user)
		@user = user
		subject = "Chaya Mushka Children's House Preschool Account Verification"
		mail(:to => user.email, :subject => subject)
	end
end