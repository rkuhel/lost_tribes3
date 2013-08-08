function display_event(){
	console.log("in display_event")

}

$(function(){
	$('.event_teaser').on('mouseenter', display_event)

});