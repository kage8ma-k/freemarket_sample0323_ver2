$(document).on('turbolinks:load', function() {
  // 金額出品部分（入力したら出現）
  $(function() {
    $(".form-group-price__left__input").on("keyup", function() {
      var input_price = $(".form-group-price__left__input").val();
      var fee = Math.ceil(input_price*0.9)
      //販売手数料= 売上の10%(0.9)。Math.ceil小数点以下切り上げのJS関数
      var comission = input_price - fee
      if ( 300 <= input_price && input_price <= 9999999){
        document.getElementById('fee').innerHTML = "¥"+ Number(comission).toLocaleString();
        document.getElementById('profit').innerHTML = "¥"+ Number(fee).toLocaleString();
      }
      else{
        document.getElementById('fee').innerHTML = "-";
        document.getElementById('profit').innerHTML = "-";
      }
    });
  });
  // 金額編集部分（最初に出現させる）
  $(function() {
    $(".form-group-price__left__input").ready( function() {
      var input_price = $(".form-group-price__left__input").val();
      var fee = Math.ceil(input_price*0.9)
      //販売手数料= 売上の10%(0.9)。Math.ceil小数点以下切り上げのJS関数
      var comission = input_price - fee
      if ( 300 <= input_price && input_price <= 9999999){
        document.getElementById('fee').innerHTML = "¥"+ Number(comission).toLocaleString();
        document.getElementById('profit').innerHTML = "¥"+ Number(fee).toLocaleString();
      }
      else{
        document.getElementById('fee').innerHTML = "-";
        document.getElementById('profit').innerHTML = "-";
      }
    });
  });
});

// input_price 入力した金額
// fee 販売手数料
// profit 販売利益
// comission 売価ー販売手数料（手元に残る金額）
