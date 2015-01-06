var ready;
ready = function() {
  $("#events").bind("ajax:success",function(e,data,status,xhr){
    console.log(data);
    $(".modal-body").text('');
    var new_event=$("#tango-event").clone();
    $(new_event).find("#title").text(data.title);
    $(new_event).find("#time").text(data.eventTime);
    $(new_event).find("#category").text(data.category);
    $(new_event).find("#cost").text(data.cost);
    $(new_event).css("display","block")
    $(".modal-body").append($(new_event));
    $("#myModal").modal("show");
  });
  $('.datePick').multiDatesPicker({
     // minDate: 0,
     // maxDate: 60,
     dateFormat: "yy-mm-dd",
     maxPicks: 8
  });
$("#preview").on("click",function(){
  var element = document.getElementById('event_description');
  var text=element.value
  console.log(element.value)
  $(".map-modal-body").find("#title").text($("#event_title").val());
  $(".map-modal-body").find("#time").text($("#event_eventTime").val());
  $(".map-modal-body").find("#cost").text($("#event_cost").val());
  $(".map-modal-body").find("#category").text($("#event_category").val());
  $(".map-modal-body").find("#address").text($("#event_address").val()+" "+$("#event_city").val()+" "+$("#event_zipcode").val());
  $(".map-modal-body").find("#description").text($("#event_description").val());

})

};

$(document).ready(ready);
$(document).on('page:load', ready);