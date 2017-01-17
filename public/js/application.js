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
     $.ajax({
        type: 'delete',
        url: url //"/questions/10/comments/28"
      }).success(function(response){

      })
      $(e.target).parent().hide()

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
      target.remove();

   })

   $('.question_add_comment').on('click', function(e) {
      e.preventDefault();
      var url = $(e.target).attr('href');

     $.ajax({
        type: 'get',
        url: url //"/questions/10/comments/new
      }).success(function(response){

        (e.target).before($(response)[25])
      });
    });


    $('body').on('submit', 'form.comment_form', function(e) {
       e.preventDefault();
       var url = $(e.target).attr('action');
      $.ajax({
         type: 'post',
         url: url, //"/questions/10/comments"
         data: $(e.target).serialize()
       }).success(function(response){
         $('.all_comments_for_question').append($(response))
         $('form.comment_form').hide()
       })

    })


});
