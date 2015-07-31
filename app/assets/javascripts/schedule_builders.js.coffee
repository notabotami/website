# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#schedule_builder_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#schedule_builder_end_date').datepicker
    dateFormat: 'yy-mm-dd'