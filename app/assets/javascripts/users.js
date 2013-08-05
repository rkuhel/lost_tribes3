

function goto_edit_user_page(e){
  e.preventDefault();
  // console.log('got into js function!');

  var user_row = $(this).parent().parent();
  var user_id = user_row.attr('data-user-id');

  location.href="/users/"+user_id+"/edit"
}

// function remove_from_users_events(e){
//   e.preventDefault();

//   var event_id = $(this).data('event-id');
//   var user_id = $('.user-id').data('user-id');
//   console.log(event_id);
//   console.log(user_id);

//   $.ajax({
//     type: 'PUT',
//     url: "users/"+event_id,
//     success: function(data){
//       console.log('success!');
//       location.href="/users/"
//     }
//   })

// }


$(function(){
  $('tbody').on('click', '.edit-user-button', goto_edit_user_page);
  // $('body').on('click', '.cancel-attendance', remove_from_users_events);
});