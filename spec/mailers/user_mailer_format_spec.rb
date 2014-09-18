require 'spec_helper'

describe UserMailer do
	context "User verified" do
		let!(:verified_user) { create(:user) }
		let!(:admin_user) { create(:admin_user) }
		let!(:email) { UserMailer.user_verified(verified_user) }

		it "sends out an email notification of verification" do
			email.to.should include(verified_user.email)

			subject = "Chaya Mushka Children's House Preschool Account Verification"
			email.subject.should include(subject)

			message = "For any questions, please do not hesitate to call the Chaya Mushka Administrative Office at (404) 843-9582 or send us an email at office@chayamushka.org."
			email.body.should include(message)

			from = "- The Chaya Mushka Children's House Preschoool Administrative Office"
			email.body.should include(from)
		end
 	end

 	context "Forgot Password" do
 		let!(:forgot_password_user) { create(:forgot_password_user) }
 		let!(:email) { UserMailer.password_reset(forgot_password_user) }

 		it "sends out an email with password reset instructions" do
 			email.to.should include(forgot_password_user.email)

 			subject = "Chaya Mushka Children's House Preschool Password Reset"
 			email.subject.should include(subject)

 			message = "To reset your password, click the link below."
 			email.body.should include(message)

		 	from = "- The Chaya Mushka Children's House Preschoool Administrative Office"
			email.body.should include(from)
 		end
 	end
end