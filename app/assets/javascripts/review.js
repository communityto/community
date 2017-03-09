// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $(".review_form").on('submit', function(event){
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

      var content = review.content;
      var acc = review.accuracy;
      var comm = review.communication;
      var fac = review.facilities;
      var loc = review.location;
      var name = user.first_name;
      var time = review.updated_at;
      var reviewIdCreated = review.id;
      console.log(reviewIdCreated);

// I want to access this variable ^^^

      // console.log(content);
      $('#review_all').prepend(
        "<div class='review_container' data-review-id = '" + reviewIdCreated + "'>",
        "<div id='review_fade'" + reviewIdCreated + ">",
        '<p>' + content + '</br>',
        'Accuracy: ' + acc + '</br>',
        'Communication: ' + comm + '</br>',
        'Facilities: ' + fac + '</br>',
        'Location: ' + loc + '</br></br>',
        "<a data-confirm='Are you sure?' class='edit_review' rel='nofollow' data-method='update' href='/reviews/'" + reviewIdCreated + '">Edit your review</a></br></br>',
        "<a data-confirm='Are you sure?' class='delete_review' rel='nofollow' data-method='delete' href='/reviews/'" + reviewIdCreated + '">Destroy</a></br></br>',
        'By: ' + name + '</br></br>',
        'Added on: ' + time + '</br></br>',
        '<button>Helpful?</button></br>');
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

    // $('body').delegate('.del_review','click',function(){
    //     alert("success this");
    // });

// $('.del_review').on('click', function(event){
$('body').delegate('.delete_review','click',function(event){
    console.log(event);
    event.stopPropagation();
    event.preventDefault();
    alert("selected!");
    var reviewId = $('.review_container').attr('data-review-id');
    // console.log(userId);
    var spaceId = $('.space_container').attr('data-space-id');
    console.log(spaceId);
    // console.log(event);

// event.target

    $.ajax({
        url: '/reviews/' + reviewId,
        type: 'POST',
        dataType: 'json',
        data: {"_method":"delete"},
        success: function(response){
        $('#review_fade'+ reviewId).fadeOut("slow");},
        // $('#review_fade'+reviewId).fadeOut();},
    }).done(function(responseData) {
      alert("Done!");
      console.log(responseData);
      var fadeId = responseData.id;
      console.log(fadeId);
      // responseData here is the review object
      // $('#review_fade'+fadeId).fadeOut("slow");

      // $('#delete_container').closest("div").fadeOut();
      // $('.delete_review').closest("div").fadeOut();
      // console.log("This delete is happening!");
      alert("End Fade Out!!");
    }).fail(function(repsonseData){
      // console.log(responseData);
      console.log("Delete Ajax failed!");
    });
  });

  $('body').delegate('.edit_review','click',function(){
      console.log(event);
      event.stopPropagation();
      event.preventDefault();
      alert("selected!");
      // console.log(this);
      var reviewId = $('.review_container').attr('data-review-id');
      // console.log(userId);
      var spaceId = $('.space_container').attr('data-space-id');
      // console.log(spaceId);
      // console.log(event);
      $.ajax({
          url: '/reviews/' + reviewId + '/edit',
          type: 'GET',
          dataType: 'json',
      }).done(function(responseData) {
        alert("Done!");
        console.log(responseData);
        alert("End Fade Out attempt!!");
      }).fail(function(repsonseData){
        // console.log(responseData);
        console.log("Delete Ajax failed!");
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
