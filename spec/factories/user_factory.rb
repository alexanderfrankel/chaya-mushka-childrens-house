FactoryGirl.define do
	factory :user do
		first_name "John"
		last_name "Snow"
		email "sample@example.com"
		password "password"
		password_confirmation "password"
		shutterfly_url "www.myshutterfly.com"

		factory :faculty_user do
			faculty true
		end

		factory :admin_user do
			admin true
		end
	end
end