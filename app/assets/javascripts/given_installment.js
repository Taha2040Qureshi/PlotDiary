$(document).ready(function(){
  $('.select-customer').on('change',function(){
    $.ajax({
      url: "/town/given_installments/get_installment_details_land_master",
      type: "GET",
      dataType: "script",
      data:
         {land_master_id: $('.select-customer option:selected').val()},

      success: function(){
       console.log('got it');
        }
    });
  });

  $('.number-input').on('input',function(){
    var no_ins = $('.number-input').val();
    var ins_amount = $('.installment_amount').html();
    var total_amount = no_ins * ins_amount;
    $('.total-amount').html(total_amount);
  });
});
