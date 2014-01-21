$(document).ready(function () {
    $('.sidenav-title').click(function(e) {

        $('.main-sidenav-title').removeClass('active');

        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
       
    });
});

$(document).ready(function () {
    $('.subtitle').click(function(e) {

        $('.sidenav-subtitle').removeClass('active');

        var $parent = $(this).parent();
        if (!$parent.hasClass('active')) {
            $parent.addClass('active');
        }
       
    });
});

$(document).ready(function() {
  $(".right.carousel-control").click();

  $('.carousel').carousel({
  interval: 2000
  });
});

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
