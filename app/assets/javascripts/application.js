// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.nestedSortable
//= require sortable_tree/initializer
//= require jquery-ui/effect-blind
//= require bootstrap-sprockets
//= require jquery_nested_form
//= require turbolinks
//= require nested_form_fields
//= require underscore
//= require gmaps/google
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .

 $(document).ready(function () {
    $("#new_city").validate({
    debug: true,
      rules: {
        "city[cities_main][city_first]": {required: true}
      },
      messages: {
        "city[cities_main][city_first]": "Please input your city"
      }
    });
  });