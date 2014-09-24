function eventsCalendar() {
	calendarController = new CalendarController(new Calendar, new CalendarView);
	calendarController.init(calendarEventsData);
}