$(document).ready(function() {
    // Like comment function
  $(".up").on("click", ".fa-arrow-up", function(){
    var object = $(this);
    var voteCount = object.data('voteCount');
    var userId = object.data('userId');
    var url = object.data("url");

    if(userId){
      $.ajax({
        type: 'GET',
        url: url,
        success: function(){
          if(voteCount >= 0) {
            $(".vote-count").text('+' + (voteCount + 1));
          }
        }
      });
    } else {
      $(".alert").hide();
      $(".flash-messages").append("<div class='alert alert-danger'> You need to sign in for that action!!</div>")
    }

  });
});
