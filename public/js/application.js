$(document).ready(function(){

  $(".click").on('click', appendForm);
  $("body").on('click','.button', appendEvent);

});

var appendForm = function(event){
  event.preventDefault();
  $.get('/create', function(response){
    var form = response;
    $(".event_table").append(form);
  });
}

var appendEvent = function(event){
  event.preventDefault();
  var data = $(".input_form").serialize();
  $.post('/create', data, function(response){
    var events = response;
    $(".event_table").remove();
    $(".container").append(events);
  });
}
