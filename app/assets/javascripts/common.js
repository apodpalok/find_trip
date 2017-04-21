$( document ).on('turbolinks:load', function() {
  jQuery(function($) {

      $("tr[data-link]").click(function() {
          window.location = $(this).data('link');
      });

      $(".with-chosen").chosen();

      $('#car_car_manufactory_id').on('change', function(){
        var carModelsUrl = $(this).data().carModelsPath;
        var carManufactoryId = $(this).val();
        var CarModelsSelect = $('#car_car_model_id');

        CarModelsSelect.html('');

        $.ajax({
          url: carModelsUrl,
          method: 'GET',
          data: 'car_manufactory_id='+carManufactoryId

        }).done(function (data) {
          $.each(data.car_models, function(index, element) {
            CarModelsSelect.append($("<option>").attr("value", element.id).text(element.model));
          })
        }).always(function (data) {
          CarModelsSelect.trigger("chosen:updated");
        });
      })
  });
})