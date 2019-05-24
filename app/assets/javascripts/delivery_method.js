$(function() {

  // 自要素の次を指定
  $(document).on('change', ".form-group__fee", function() {
    $('.form-group__fee').next().css('display', 'block');
  });
});
