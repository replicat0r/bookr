$(document).ready(function() {
    /* Activating Best In Place */
    jQuery(".best_in_place").best_in_place();
    var currentMonth = moment().format('YYYY-MM');
    var nextMonth = moment().add('month', 1).format('YYYY-MM');
		//$.datepicker.formatDate( 'yy-mm-dd' )

  $.datepicker.setDefaults({ dateFormat: 'yy-mm-dd' });

});
