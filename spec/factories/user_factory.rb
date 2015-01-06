FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		first_name "John"
		last_name "Snow"
		email { generate(:email) }
		password "password"
		password_confirmation "password"
		verified true

		factory :faculty_user do
			first_name "Fack"
			last_name "Ulty"
			faculty true
		end

		factory :admin_user do
			first_name "Ad"
			last_name "Min"
			faculty true
			admin true
		end

		factory :unverified_user do
			first_name "Unverified"
			last_name "User"
			verified false
		end

		factory :forgot_password_user do
			password_reset_token SecureRandom.urlsafe_base64
			password_reset_sent_at Time.zone.now
		end

		factory :inactive_user do
			active false
		end
	end
end