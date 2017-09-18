$(document).ready(function (){
  $(".course-letters").on("click", "a", function(event){
    var linkTo = $(this).attr("href");
    event.preventDefault();
    $('body').animate({
      'scrollTop' : $(linkTo).offset().top
    }, 700);
  });

  $("#courses_index").on("click", ".to-top", function(event){
    var linkTo = $(this).attr("href");
    event.preventDefault();
    $('body').animate({
      'scrollTop' : $(linkTo).offset().top
    }, 700);
  });
});
