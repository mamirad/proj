$(document).ready(function() {
    // $("#err").html("<ul><li>Question paper must contain atleast 2 questions to submit</li></ul>")


    $(".aq").click(function() {
        var a = $("#mcq_form").find("div.fields:visible").length;
        if (parseInt(a)  >0){

            $(".form-actions").show();
        }
        else
        {
            $(".form-actions").hide();
        }


    });






});