$(document).ready(function() {
  $(".faq").on("click", ".question", function(){
    $(".answer").hide(200);
    $(this).parent().children(".answer").show()
  });
});
