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
