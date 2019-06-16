$(document).on('turbolinks:load', function(){
  $('.search-form__detail__price__pull-down__select').change(function() {
    var price_range = $(this).children('option:selected').val().split('~', 2);
    var min_price = price_range[0];
    var max_price = price_range[1];
    $('.search-form__detail__price__inputs__min').val(min_price);
    $('.search-form__detail__price__inputs__max').val(max_price);
  });
});
