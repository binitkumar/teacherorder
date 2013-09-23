// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.nested-fields
//= require teachers
//= require_tree .

function update_total(id){
    container = $("#"+id).parent().parent().parent().parent().parent().parent() ;

    total = 0 ;
    container.children().find(".quantity").each(function(index){
      if( parseInt($(this).val())  ){
        total += parseInt($(this).val());
      }
      console.log(total);
    })

    total_container = container.parent().parent().parent().parent().parent().parent().children().find(".total")
    total_container.val(total * 15 );
}

$(document).ready(function(){
  $("#teacher_email_validator").click(function(){
    email = $("#teacher_email").val();
    $.get("/teachers/verify_email?email="+email ,function(resp){
      if( resp == 'true'){
        alert("Email address validated successfully. You can fill the form now.")
          $("form").children().find('input').removeAttr("disabled");
      }else{
          $("form").children().find('input').attr("disabled", "disabled");
      }
    })
  })
})
