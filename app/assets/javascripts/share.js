$(document).on('ready page:load', function () {
  $('.share').each(function(i, obj){
    var object      = $(obj)
    var destination = {url: object.data('url')};
    $.post(object.data('path'),destination,function(data){
      object.html(data);
    })
  });
});