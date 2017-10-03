$(document).ready( function() {
  $(".comment-detail").on("click", ".create_reply", function() {
    $(this).parent().siblings(".hidden-form").toggle()
  });

  $(".comment-detail").on("click", ".view_replies", function() {
    $(this).parent().siblings(".replies").toggle()
  });
});
