var ready = function() {
  homepageCarousel();
  loungeInitialize();
};

$(document).ready(ready);
$(document).on('page:load', ready);