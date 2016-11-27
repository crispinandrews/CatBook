$(document).ready(function () {

  $('.commenthisses-link').on('click', function(event){
    event.preventDefault();

    var commentHissCount = $(this).siblings('.comment_hisses_count');

    $.post(this.href, function(response){
    commentHissCount.text(response.new_comment_hisses_count);

    });
  });
});
