var ready = function() {
  homepageCarousel();
  navDropdown();
};

$(document).ready(ready);
$(document).on('page:load', ready);