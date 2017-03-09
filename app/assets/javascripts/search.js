$(function() {
  $("#capacity-slider").slider({
    min: 0,
    max: 250,
    value: 0,
    step: 5,
    slide: function(event, ui) {
       $("#capacity-search").val(ui.value);
    }
  });
  $("#capacity-search").val($("#capacity-slider").slider( "value"));
});
