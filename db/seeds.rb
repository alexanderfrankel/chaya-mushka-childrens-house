User.create(first_name: "alex",
						last_name: "frankel",
						email: "alexxander.frankel@gmail.com",
						password: "password",
						password_confirmation: "password",
						shutterfly_url: "does not exist")

User.create(first_name: "alex",
						last_name: "frank",
						email: "alex.frankel@gmail.com",
						password: "password",
						password_confirmation: "password",
						shutterfly_url: "does not exist",
						faculty: true)