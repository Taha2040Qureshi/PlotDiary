$(document).ready(function(){

  console.log("hello");
  $('.no-of-ins').on('input', function() {
    console.log("yahooo");
  var total_amount = document.getElementsByClassName('total-amount')[0].value;
  var advance_amount = document.getElementsByClassName('advance-amount')[0].value;
  var no_of_installment = document.getElementsByClassName('no-of-ins')[0].value;

  var rem_amount = total_amount - advance_amount;
  var amount_per_ins = rem_amount / no_of_installment;
  console.log('yeshshh');

  document.getElementsByClassName('per-ins-amount')[0].value = amount_per_ins;

});

});

