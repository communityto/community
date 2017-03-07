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
            var revContent = responseData.content;
            var revAcc = responseData.accuracy;
            var revComm = responseData.communication;
            var revFac = responseData.facilities;
            var revLoc = responseData.location;
            var revName = responseData.user_id;
            var revTime = responseData.updated_at;

            console.log(responseData);

            $('#reviews_ajax').append(
              '<p>' + revContent + '</br>',
              'Accuracy: ' + revAcc + '</br>',
              'Communication: ' + revComm + '</br>',
              'Facilities: ' + revFac + '</br>',
              'Location: ' + revLoc + '</br></br>',
              'By User ID: ' + revName + '</br>',
              'Added on: ' + revTime + '</br>');
            $('.delete-button"')
            console.log("This is coming in successfully");
            // $('#reviews_list').prepend('<%= render @review %>');
            // $('#review_message').prop('disabled', false);
          }).fail(function(responseData){
            console.log("u fail bb");
          }).always(function(responseData){
            console.log("this is always happening");
          });
      });
  $('.delete-button').bind('ajax:success', function() {
    $("#review_message").closest("#review_message").fadeOut();
    console.log("This delete is happening!");
  });
});


// console.log("This delete is happening!");
// console.log("#review_message");
// $("#review_message").fadeOut();
