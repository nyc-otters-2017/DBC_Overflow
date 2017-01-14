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

  $('.downvote').on("submit", function(e) {
    e.preventDefault();
    var targert = $(e.target).parent().parent().children()[1]
    var url = $(e.target).attr('action')
    $.ajax({
      type: "POST",
      url: url,
    }).success(function(response) {
      $(target).text(response);
    });
  });

  $('.question_comment_delete').submit(function(e) {
    e.preventDefault();
    var url = $(e.target).attr('action');
    var target = $(e.target)

   $.ajax({
      type: 'delete',
      url: url
    }).success(function(response){
    })
    target.remove()

 })


 $('.question_answer_comment_delete').submit(function(e) {
    e.preventDefault();
    var url = $(e.target).attr('action');
    var target = $(e.target)

   $.ajax({
      type: 'delete',
      url: url
    }).success(function(response){
    })
    target.remove()

 })
 
});
