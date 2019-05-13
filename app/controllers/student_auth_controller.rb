class StudentAuthController < ApplicationController
  layout 'custom_layouts/studentlayout'

  def home
  end

  def quiz_code
    @quiz_questions = Qquiz.find(params[:fld_quiz_code]).course_questions.select("quizquestions.id as 'qqid',course_questions.*")

    # session[:quizid]=params[:fld_quiz_code]

  end

  def sol_quiz

    @ans = params[:student_ans]
    @q = params[:quizquestionid]

    @check = StudentResult.new(user_id: current_user.id, quizquestion_id: @q, ans: @ans, max: 10, obtain: 9999)
    if (@check.save)
      respond_to do |format|
        format.js {render partial: 'student_auth/abc'}

      end
    end
  end
end
