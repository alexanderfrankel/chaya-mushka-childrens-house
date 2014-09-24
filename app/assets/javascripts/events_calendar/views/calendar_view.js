function CalendarView() {};

CalendarView.prototype = {
	render: function(calendar) {
		console.log(calendar.events);
		$('.calendar').fullCalendar({
			events: calendar.events
		});
	}
}