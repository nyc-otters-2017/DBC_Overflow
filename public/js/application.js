$(document).ready(function () {
  $(".up_vote").on("submit", function(e){
    // debugger
    e.preventDefault();
    var target = $(e.target).parent().parent().children()[1]
    var url = $(e.target).attr('action')
    $.ajax({
      type: "POST",
      url: url
    }).success(function(response) {
      $(target).text(response);
    });
  });

});
