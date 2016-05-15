$(window).scroll(function() {
  var st = $(this).scrollTop();
  $(".header_text").css({
    "transform" : "translate(0%, " + st + "%"
  });
}
