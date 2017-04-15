$( document ).on('turbolinks:load', function() {
  $('#datetimepicker').datetimepicker({
  format: "YYYY-MM-DD HH:mm",
  sideBySide: true
  });
});

$( document ).on('turbolinks:load', function() {
  $('#datepicker').datetimepicker({
  format: "YYYY-MM-DD"
  });
});