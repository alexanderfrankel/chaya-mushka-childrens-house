FactoryGirl.define do
	factory :tuition do
		year "2014 - 2015"
		amount 500
		current false

		factory :current_tuition do
			current true
		end
	end
end