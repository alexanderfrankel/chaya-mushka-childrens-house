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
	end
end