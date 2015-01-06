function Calendar() {
	this.events = []
}

Calendar.prototype = {
	populate: function(eventData) {
		for(var i=0; i < eventData.length; i++) {
			this.events.push(new Event(
																 eventData[i].title,
																 eventData[i].start_date,
																 eventData[i].end_date,
																 eventData[i].description));
		}
	}
}