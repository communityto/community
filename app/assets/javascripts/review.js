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

      var content = review.content;
      var acc = review.accuracy;
      var comm = review.communication;
      var fac = review.facilities;
      var loc = review.location;
      var name = user.first_name;
      var time = review.updated_at;
      var reviewIdCreated = review.id;
      console.log(reviewIdCreated);

      $('#review_all').prepend(
        "<div class='review_container' data-review-id = '" + reviewIdCreated + "'>",
        "<div id='review_fade'" + reviewIdCreated + ">",
        '<p>' + content + '</br>',
        'Accuracy: ' + acc + '</br>',
        'Communication: ' + comm + '</br>',
        'Facilities: ' + fac + '</br>',
        'Location: ' + loc + '</br></br>',
        'By: ' + name + '</br></br>',
        'Added on: ' + time + '</br></br>');
      }).fail(function(responseData){
        console.log("u fail bb");
        console.log(responseData);
      }).always(function(responseData){
        console.log("this is always happening");
      });
    });

$('.reviews_container').delegate('.delete_review','click',function(event){
    event.stopPropagation();
    event.preventDefault();
    var reviewElement = $(event.target).parent();
    var reviewId = $(event.target).parent().data('reviewId');
    alert("selected!");
      $.ajax({
        url: '/reviews/' + reviewId,
        type: 'POST',
        dataType: 'json',
        data: {"_method":"delete"},
    }).done(function(responseData) {
      $(reviewElement).fadeOut("slow", function(){
        alert('after fade out');
      });
    }).fail(function(repsonseData){
      console.log("Delete Ajax failed!");
    });
  });
});
