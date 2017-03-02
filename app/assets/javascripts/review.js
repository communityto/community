// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  $("#new_review").on('submit', function(event){
    event.preventDefault();
          $.ajax({
              url: $(this).attr('action'),
              type: $(this).attr('method'),
              dataType: 'json',
              data: $(this).serialize(),
          }).done(function(responseData) {
            console.log("This is coming in successfully");
            $('#reviews_list').prepend('<%= render @review %>');
            $('#review_message').prop('disabled', false);
          }).fail(function(responseData){
            console.log("u fail bb");
          }).always(function(responseData){
            console.log("this is always happening")
          });
      });
});




// $(document).ready(function() {
//   $("#new_review").on('keypress', function(e){
//       if(e.keyCode==13){
//           $.ajax({
//               url: $(this).attr('action'),
//               type: $(this).attr('method'),
//               dataType: 'script',
//               data: $(this).serialize(),
//           });
//       }
//   });
// });
