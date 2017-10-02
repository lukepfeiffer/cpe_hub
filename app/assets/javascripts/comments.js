$(document).ready( function() {
  $(".comment-detail").on("click", ".create_reply", function() {
    $(this).parent().siblings(".hidden").show()
  });
});
