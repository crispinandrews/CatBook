$(document).ready(function() {

  $('.hisses-link').on('click', function(event){
      event.preventDefault();

      var hissCount = $(this).siblings('.hisses_count');

      $.post(this.href, function(response){
        hissCount.text(response.new_hiss_count);
    });
  });
});
