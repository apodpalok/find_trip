$( document ).on('turbolinks:load', function() {
  jQuery(function($) {

      $("tr[data-link]").click(function() {
          window.location = $(this).data('link');
      });

  });
})