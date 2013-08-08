function mark_shipped(e){
  e.preventDefault();

  var order_row = $(this).parent();
  var order_id = order_row.data('order-id');
  // console.log("order id is equal to " + order_id);

  $.ajax({
  	type: 'POST',
  	url: '/carts/'+order_id+'/mark_shipped',
  	success: function(data){
  		console.log("order passed to user controller. it worked..")
  		order_row.css('background-color', 'orange')
      order_row.children('.mark_shipped').text('shipped!')

  		console.log(data)
  	}
  })

}
$(function(){
	$('tbody').on('click', '.mark_shipped', mark_shipped);
});