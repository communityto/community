// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  $("#new_review").on('keypress', function(e){
      if(e.keyCode==13){
          $.ajax({
              url: $(this).attr('action'),
              type: $(this).attr('method'),
              dataType: 'script',
              data: $(this).serialize(),
          });
      }
  });
});
