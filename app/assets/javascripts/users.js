

function goto_edit_user_page(e){
  e.preventDefault();
  // console.log('got into js function!');

  var user_row = $(this).parent().parent();
  var user_id = user_row.attr('data-user-id');

  location.href="/users/"+user_id+"/edit"
}

$(function(){
  $('tbody').on('click', '.edit-user-button', goto_edit_user_page);
});