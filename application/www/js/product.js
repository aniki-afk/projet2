'use strict';

let basket = new Basket();

$('.addToBasket').on('click', function(event){
  event.preventDefault();
  let id = $(this).data('id');
  // console.log(id);
  let name = $(this).data('name');
  // console.log(name);
  let price = $(this).data('price');
  // console.log(price);
  let quantity = $('#product-'+id).val();
  // console.log(quantity);
  if(isNaN(quantity) || quantity == '') {
    $('#errorPopUp').removeClass('hide');
    $('#product-'+id).val('');
  } else {
    basket.addBasket(id, name, quantity, price);
    $('#productPopUp').removeClass('hide');
    $('#productNumber').text(quantity);
    $('#product-'+id).val('');
  }
});

$('.closePopUp').on('click', function() {
  $('#productPopUp').addClass('hide');
  $('#errorPopUp').addClass('hide');
});

$('.empty').on('click', function() {
  basket.clearBasket();
  // console.log('ok');
});

if (window.location.href.indexOf('/basket') != -1) {

  basket.displayBasketAll();
  $(document).on('click','.trash', function(event) {
    event.preventDefault();
    let id = $(this).data('index');
    console.log(id);
    basket.removeBasket(id);
  });
}

if(window.location.href.indexOf('/payment') != -1) {

  basket.loadBasketInput('#orders');
}

if(window.location.href.indexOf('/sucess') != -1) {

  basket.clearBasket();
}
