$(function() {
  $(".input-price").on("keyup", function() {
    var input_price = $(".input-price").val();
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
