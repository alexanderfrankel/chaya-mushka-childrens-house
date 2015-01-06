module GmailHelpers
	def gmail_connection
		settings = ActionMailer::Base.smtp_settings
		@gmail_connection ||= Gmail.connect(settings[:user_name], settings[:password])
	end

	def chaya_mushka_emails
		gmail_connection.inbox.find(:unread, :from => "Chaya Mushka App")
	end

	def clear_chaya_mushka_emails!
		chaya_mushka_emails.map(&:delete!)
	end
end

RSpec.configure do |config|
	config.include GmailHelpers
end