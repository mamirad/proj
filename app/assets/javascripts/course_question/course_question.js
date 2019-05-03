var add_option_count = 0
var remove_option_count = 0

function add_option() {
    if (add_option_count == 0) {

        add_option_count = add_option_count + 1;
        document.getElementById("more_option").innerHTML = '<label>option4</label><input class="form-control string optional" type="text" name="course_question[option4]" id="course_question_option4">'

    } else if (add_option_count == 1) {

        add_option_count = add_option_count + 1;
        document.getElementById("more_option2").innerHTML = '<label>option5</label><input class="form-control string optional" type="text" name="course_question[option5]" id="course_question_option5">'

    } else {
        alert("sorry no more allow");
    }


}

function remove_option() {
    if (add_option_count == 0) {
        alert('no more fields');
    } else {
        if (add_option_count == 1) {
            $(document).ready(function () {
                $("#course_question_option4").remove();
                add_option_count = add_option_count - 1;
                remove_option_count = remove_option_count + 1;
            });

        } else if (add_option_count == 2) {
            $(document).ready(function () {
                $("#course_question_option5").remove();
                add_option_count = add_option_count - 1;
                remove_option_count = remove_option_count + 1;
            });

        }
    }


}

function fill_in_the_blank() {
    document.getElementById("dynamic_question").innerHTML = '<label>Fill in the blank</label><input class="form-control string optional" type="text" name="course_question[question]" id="course_question_question" placeholder="There are-----rivers in pakistan"/><label>Answer</label><input class="form-control string optional" type="text" name="course_question[answer]" id="course_question_answer"><input class="form-control string optional" type="hidden" name="course_question[option1]" id="course_question_option1"><input class="form-control string optional" type="hidden" name="course_question[option2]" id="course_question_option2"><input class="form-control string optional" type="hidden" name="course_question[option3]" id="course_question_option3"><input class="form-control string optional" type="hidden" name="course_question[option4]" id="course_question_option4"><input class="form-control string optional" type="hidden" name="course_question[option5]" id="course_question_option5">'
    $('input').removeClass( "optional" ).addClass('form-control is-valid string required');
}

function true_false() {
    document.getElementById("dynamic_question").innerHTML = '<label>True False</label><input class="form-control string optional" type="text" name="course_question[question]" id="course_question_question" placeholder="There are 5 rivers in pakistan"><label>Answer</label><input class="" type="checkbox" name="course_question[answer]" id="course_question_answer"><input class="form-control string optional" type="hidden" name="course_question[option1]" id="course_question_option1"><input class="form-control string optional" type="hidden" name="course_question[option2]" id="course_question_option2"><input class="form-control string optional" type="hidden" name="course_question[option3]" id="course_question_option3"><input class="form-control string optional" type="hidden" name="course_question[option4]" id="course_question_option4"><input class="form-control string optional" type="hidden" name="course_question[option5]" id="course_question_option5">'
}

function descriptive() {
    document.getElementById("dynamic_question").innerHTML = '<label>Descriptive Question</label><input class="form-control string optional" type="text" name="course_question[question]" id="course_question_question" placeholder="Descriptive Question"><label>Answer</label><input class="form-control string optional" type="text" name="course_question[answer]" id="course_question_answer"><input class="form-control string optional" type="hidden" name="course_question[option1]" id="course_question_option1"><input class="form-control string optional" type="hidden" name="course_question[option2]" id="course_question_option2"><input class="form-control string optional" type="hidden" name="course_question[option3]" id="course_question_option3"><input class="form-control string optional" type="hidden" name="course_question[option4]" id="course_question_option4"><input class="form-control string optional" type="hidden" name="course_question[option5]" id="course_question_option5">'
}

function mcq() {
    document.getElementById("dynamic_question").innerHTML = '<p id="info" class="alert alert-info">you can add upto 5 otpion maximum and minimum 3</p><label>MCQs Question</label><input class="form-control string optional" type="text" name="course_question[question]" id="course_question_question" placeholder="Mcqs Question"><label>Answer</label><input class="form-control string optional" type="text" name="course_question[answer]" id="course_question_answer"><label>option1</label><input class="form-control string optional" type="text" name="course_question[option1]" id="course_question_option1"><label>option2</label><input class="form-control string optional" type="text" name="course_question[option2]" id="course_question_option2"><label>option3</label><input class="form-control string optional" type="text" name="course_question[option3]" id="course_question_option3"><div id="more_option"></div><div id="more_option2"></div><br><p class="btn btn-default btn-xs" onclick="add_option()">+Add</p><p class="btn btn-default btn-xs" onclick="remove_option()">Remove -</p>'

$('input').removeClass( "optional" ).addClass('form-control is-valid string required')


}


$(document).ready(function () {
    // alert( $('#course_question_questiontype').val());
    if($('#course_question_questiontype').val()>0){

    }else{
        $('#submit_dynamic_question').prop('disabled', true);
    }


    $('#course_question_questiontype').change(function () {
        var type = this.value

        if (type == 1) {
            // 1 for fill in the blank
            fill_in_the_blank()
            $('#submit_dynamic_question').prop('disabled', false);

        }
        if (type == 2) {
            // 2 for true false
            true_false()
            $('#submit_dynamic_question').prop('disabled', false);
        }
        if (type == 3) {
            // 3 for  mcqs
            mcq()
            $('#submit_dynamic_question').prop('disabled', false);
        }
        if (type == 4) {
            //4 for descriptive
            descriptive()
            $('#submit_dynamic_question').prop('disabled', false);
        }

    });


});