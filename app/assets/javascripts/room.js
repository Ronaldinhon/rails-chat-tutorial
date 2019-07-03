$(function() {
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});

$(function() {
	$('button[type="button"]').on('click', function() {
    $('#new_room_message').find('input[type="text"]').val(this.dataset.typeid);
    $('#new_room_message').find('.btn.btn-primary.chat-input').click();
    $('#new_room_message').find('input[type="text"]').val('');
  });
});