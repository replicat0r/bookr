$('.data_table').html('<%= j render 'table' %>');
href = $('.add_btn').attr('href');
new_date = href.replace(/\?.*/,'?date=<%= "#{@date}" %>' );
$('.current_date').text("Customer Data for: <%= "#{@date}" %>")


$('.add_btn').attr('href',new_date)
jQuery(".best_in_place").best_in_place();
