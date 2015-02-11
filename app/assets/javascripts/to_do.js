$(document).ready(function() {
  $('.mark_done').click(function(){
    var me = $(this);
    me.prev().val(me.prop('checked'))
    me.parent().submit()
  });
});
