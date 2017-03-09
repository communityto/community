// $(document).ready(function() {
//
//   $(".approve_booking").on('click', function(event){
//     event.preventDefault();
//     console.log(this)
//     $.ajax({
//       url: $(this).attr('action'),
//       type: 'PATCH',
//       dataType: 'json',
//       data: {"booking": {"approved": "true"}}
//     }).done(function(){
//       console.log('success');
//       $(".approved-false").remove();
//       $(".approved-true").show();
//     }).fail(function(){
//       console.log('failure');
//     }).always(function(){
//       console.log('complete');
//     });
//   });
//
// });
