//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require chosen-jquery
function chosen_init() {
  $(".chosen-select").chosen().change();
}
$(document).on('turbolinks:load', function(){chosen_init()});
