// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js

$(document).ready(function() {
  $("#space-photo").click(function(e) {
       e.preventDefault();
       $("#popup").html( $('<%= p.photo %>').attr('src', this.href) );
    });
});
