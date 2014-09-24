var ready = function() {
  homepageCarousel();
  loungeInitialize();
  eventsCalendar();
};

$(document).ready(ready);
$(document).on('page:load', ready);