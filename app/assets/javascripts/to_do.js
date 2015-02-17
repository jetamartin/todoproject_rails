$(document).ready(function() {
  $('.mark_done').click(function(){
    var me = $(this);
    me.prev().val(me.prop('checked') ? '1' : '0')
    console.log(this)
    // Removed this line because we don't want checking box to submit the form
    // because I added a button for the intire form.
    // me.parent().submit()
  });
});
