# USERS -------------------------------------------

parent = User.create(first_name: "alex",
										 last_name: "frankel",
										 email: "alexxander.frankel@gmail.com",
										 password: "password",
										 password_confirmation: "password",
										 verified: true)

faculty = User.create(first_name: "alex",
											last_name: "frank",
											email: "alex.frankel@gmail.com",
											password: "password",
											password_confirmation: "password",
											faculty: true,
											verified: true)

admin = User.create(first_name: "alex",
										last_name: "lewis",
										email: "alex.lewis@gmail.com",
										password: "password",
										password_confirmation: "password",
										faculty: true,
										admin: true,
										verified: true)

unverified = User.create(first_name: "al",
												 last_name: "frab",
												 email: "alf@gmail.com",
												 password: "password",
												 password_confirmation: "password",
												 verified: false)

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
											end_date: "2015-09-04 00:00:00",
											user: admin)

event2 = Event.create(title: "Event 2",
											description: "Event 2's description goes here.",
											start_date: "2015-07-03 00:00:00",
											end_date: "2015-07-04 00:00:00",
											user: admin)

event3 = Event.create(title: "Event 3",
											description: "Event 3's description goes here.",
											start_date: "2014-10-03 00:00:00",
											end_date: "2014-10-04 00:00:00",
											user: admin)

event4 = Event.create(title: "Event 4",
											description: "Event 4's description goes here.",
											start_date: "2014-10-10 00:00:00",
											end_date: "2014-10-11 00:00:00",
											user: admin)

event5 = Event.create(title: "Event 5",
											description: "Event 5's description goes here.",
											start_date: "2014-11-03 00:00:00",
											end_date: "2014-11-04 00:00:00",
											user: admin)

event6 = Event.create(title: "Event 6",
											description: "Event 6's description goes here.",
											start_date: "2014-11-20 00:00:00",
											end_date: "2014-11-21 00:00:00",
											user: admin)

event7 = Event.create(title: "Event 7",
											description: "Event 7's description goes here.",
											start_date: "2014-12-03 00:00:00",
											end_date: "2014-12-04 00:00:00",
											user: admin)

event8 = Event.create(title: "Event 8",
											description: "Event 8's description goes here.",
											start_date: "2014-12-30 00:00:00",
											end_date: "2014-12-31 00:00:00",
											user: admin)

event9 = Event.create(title: "Event 9",
											description: "Event 9's description goes here.",
											start_date: "2015-02-03 00:00:00",
											end_date: "2015-02-04 00:00:00",
											user: admin)

event10 = Event.create(title: "Event 10",
											description: "Event 10's description goes here.",
											start_date: "2015-04-03 00:00:00",
											end_date: "2015-04-04 00:00:00",
											user: admin)

event11 = Event.create(title: "Event 11",
											description: "Event 11's description goes here.",
											start_date: "2014-10-01 00:00:00",
											end_date: "2014-10-02 00:00:00",
											user: admin)

event12 = Event.create(title: "Event 12",
											description: "Event 12's description goes here.",
											start_date: "2014-11-29 00:00:00",
											end_date: "2014-11-30 00:00:00",
											user: admin)

event13 = Event.create(title: "Event 13",
											description: "Event 13's description goes here.",
											start_date: "2014-12-01 00:00:00",
											end_date: "2014-12-02 00:00:00",
											user: admin)

# TUITIONS ----------------------------------------

tuition1 = Tuition.create(year: "2013 - 2014",
													amount: 500,
													user: admin)

tuition2 = Tuition.create(year: "2014 - 2015",
													amount: 1000,
													current: true,
													user: admin)

# FORMS -------------------------------------------

form1 = Form.create(title: "Form 1",
										description: "Form 1's description goes here.",
										user: admin)

form2 = Form.create(title: "Form 2",
										description: "Form 2's description goes here.",
										user: admin)