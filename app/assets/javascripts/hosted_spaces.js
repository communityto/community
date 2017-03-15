$(document).ready(function() {
  var disabledDates = [];
  $('.calendarDay').on('click', function() {
    var calendarDate = $(this).data('calendardate');
    disabledDates.push(calendarDate);
    alert(disabledDates);
    $.ajax({
      url: asdf,
      type: 'post',
      data: adsf,
      success: function(data) { console.log(data); }
    });
  });
});
