//ScrollSpy

$(document).ready(function() {
  $('body').scrollspy({ target: '.affix' });
});

// this fixes the issue of the carousel not starting on page load

$(document).ready(function() {
  $(".right.carousel-control").click();

  $('.carousel').carousel({
  interval: 2000
  });
});

// this fixes the scrolling offset

$(document).ready(function(){

  $('.bs-sidebar li a').click(function(event) {
  event.preventDefault();
   
  $($(this).attr('href'))[0].scrollIntoView();
  scrollBy(0, -80);
  });
});

$(document).ready(function() {
  $('.scrollup').click(function(){
    $('body').animate({scrollTop:0}, 'fast');

    // stop the click on the link adding a # to the end of the url 
    event.preventDefault();
  });
});


