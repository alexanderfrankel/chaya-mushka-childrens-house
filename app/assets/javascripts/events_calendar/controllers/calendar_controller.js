function CalendarController(calendar, calendarView) {
	this.calendar = calendar;
	this.calendarView = calendarView;
}

CalendarController.prototype = {
	init: function(calendarData) {
		if (typeof calendarData != "undefined") {
			this.calendar.populate(calendarData);
			this.calendarView.render(this.calendar);
		}
	}
}