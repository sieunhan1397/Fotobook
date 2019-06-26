$(document).ready(function() {

        //Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
        // jQuery.validator.setDefaults({
        //   debug: true,
        //   success: "valid"
        // });
        $("#form-register").validate({
          rules: {
            password: {required: true},
            password_confirm: {equalTo: "#password"}
          }
        });
      });
