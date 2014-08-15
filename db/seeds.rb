# USERS -------------------------------------------

parent = User.create(first_name: "alex",
										 last_name: "frankel",
										 email: "alexxander.frankel@gmail.com",
										 password: "password",
										 password_confirmation: "password",
										 shutterfly_url: "does not exist")

faculty = User.create(first_name: "alex",
											last_name: "frank",
											email: "alex.frankel@gmail.com",
											password: "password",
											password_confirmation: "password",
											shutterfly_url: "does not exist",
											faculty: true)

admin = User.create(first_name: "alex",
										last_name: "lewis",
										email: "alex.lewis@gmail.com",
										password: "password",
										password_confirmation: "password",
										shutterfly_url: "does not exist",
										faculty: true,
										admin: true)

# POSTS -------------------------------------------

post1 = Post.create(title: "Post 1",
										content: "Post 1's content goes here.",
										user: faculty)

post2 = Post.create(title: "Post 2",
										content: "Post 2's content goes here.",
										user: admin)

# EVENTS ------------------------------------------

event1 = Event.create(title: "Event 1",
											description: "Event 1's description goes here.",
											start_date: "2015-09-03 00:00:00",
											end_date: "2015-09-04 00:00:00")

event2 = Event.create(title: "Event 2",
											description: "Event 2's description goes here.",
											start_date: "2015-07-03 00:00:00",
											end_date: "2015-07-04 00:00:00")

# TUITIONS ----------------------------------------

tuition1 = Tuition.create(year: "2013 - 2014",
													amount: 500)

tuition2 = Tuition.create(year: "2014 - 2015",
													amount: 1000,
													current: true)