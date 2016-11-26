$(document).ready(function() {

  $('.commentlikes-link').on('click', function(event){
      event.preventDefault();

      var commentLikeCount = $(this).siblings('.comment_likes_count');

      $.post(this.href, function(response){
        commentLikeCount.text(response.new_comment_likes_count);

    });
  });
});
