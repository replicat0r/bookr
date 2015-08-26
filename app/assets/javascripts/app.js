$(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
    var currentMonth = moment().format('YYYY-MM');
    var nextMonth = moment().add('month', 1).format('YYYY-MM');
		//$.datepicker.formatDate( 'yy-mm-dd' )

  $.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' });

  //$('.newcustomer ').bind("ajax:success", function(){alert('asds')});
  return $("#new_massage").on("ajax:success", function(e, data, status, xhr) {
    console.log('hello')
    return $("#new_massage").append(xhr.responseText);

  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_massage").append("<p>ERROR</p>");
  });

});

