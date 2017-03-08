// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  $(".review_form").on('submit', function(event){
    console.log(event);
    event.preventDefault();
    $.ajax({
        url: $(this).attr('action'),
        type: $(this).attr('method'),
        dataType: 'json',
        data: $(this).serialize(),
    }).done(function(responseData) {
      console.log(responseData);
      var user = responseData.user;
      var review = responseData.review;
      // console.log(user);
      // console.log(review);

      var content = review.content;
      var acc = review.accuracy;
      var comm = review.communication;
      var fac = review.facilities;
      var loc = review.location;
      var name = user.first_name;
      var time = review.updated_at;

      // console.log(content);

      $('#reviews_ajax').append(
        '<p>' + content + '</br>',
        'Accuracy: ' + acc + '</br>',
        'Communication: ' + comm + '</br>',
        'Facilities: ' + fac + '</br>',
        'Location: ' + loc + '</br></br>',
        '<button class="delete-button"> Destroy </button></br></br>',
        'By: ' + name + '</br></br>',
        'Added on: ' + time + '</br></br>',
        '<button class="help-button">Helpful?</button></br></br>');
        console.log("This is coming in successfully");
      // $('#reviews_list').prepend('<%= render @review %>');
      // $('#review_message').prop('disabled', false);
      }).fail(function(responseData){
        console.log("u fail bb");
        console.log(responseData);
      }).always(function(responseData){
        console.log("this is always happening");
      });
    });
  $(".delete_review").on('click', function(event){
    console.log(event);
    event.stopPropagation();
    event.preventDefault();
    // console.log(this);
    var reviewId = $('.review_container').attr('data-review-id');
    // console.log(userId);
    var spaceId = $('.space_container').attr('data-space-id');
    // console.log(spaceId);
    // console.log(event);
    alert("This is going to happen!");
    $.ajax({
        url: '/reviews/' + reviewId,
        type: 'POST',
        dataType: 'json',
        data: {"_method":"delete"},
    }).done(function(responseData) {
      alert("Done!");
      console.log(responseData);
      // console.log(this);
      $(this).closest("#review_message").fadeOut();
      console.log("This delete is happening!");
    }).fail(function(repsonseData){
      // console.log(responseData);
      console.log("Delete Aax failed!");
    });
  });
  // $(".edit_review").on('click', function(event){
  //   event.preventDefault();
  //   // console.log(this);
  //   var userId = $('.review_container').attr('data-user-id');
  //   // console.log(userId);
  //   var spaceId = $('.space_container').attr('data-space-id');
  //   // console.log(spaceId);
  //   // console.log(event);
  //   alert("This is going to happen!");
  //   $.ajax({
  //       url: "'/spaces/' + spaceId + '/reviews/' + spaceID + '?user_id=' + userId",
  //       type: 'delete',
  //       dataType: 'json',
  //   }).done(function(responseData) {
  // });
});

  // $('.delete-button').bind('ajax:success', function() {
  //   $("#review_message").closest("#review_message").fadeOut();


// console.log("This delete is happening!");
// console.log("#review_message");
// $("#review_message").fadeOut();
