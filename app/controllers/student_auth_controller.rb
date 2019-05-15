class StudentAuthController < ApplicationController
  layout 'custom_layouts/studentlayout'

  def home
  end

  def quiz_code
    begin
      if Qquiz.find(params[:fld_quiz_code]).expire_date > Date.today

        @pqr = Quizquestion.where('qquiz_id=?', params[:fld_quiz_code]).first
        @hi = StudentResult.where('quizquestion_id=?', @pqr.id).present?
        unless @hi
          @quiz_questions = Qquiz.find(params[:fld_quiz_code]).course_questions.select("quizquestions.id AS qqid","course_questions.*")

        else
          @quiz_questions = nil

          redirect_back fallback_location: quiz_code_path, :flash => {:error => "Test already taken Insufficient rights!"}

        end
      else
        redirect_back fallback_location: quiz_code_path, :flash => {:error => "Quiz Date Expired"}

      end

        # StudentResult.where(['user_id=? and quizquestion_id=?', current_user.id, @quiz_questions])
        # # session[:quizid]=params[:fld_quiz_code]
    rescue ActiveRecord::RecordNotFound => e
      redirect_back fallback_location: quiz_code_path, :flash => {:error => e}
    end
  end

  def sol_quiz

    @ans = params[:student_ans]
    @q = params[:quizquestionid]

    @check = StudentResult.new(user_id: current_user.id, quizquestion_id: @q, ans: @ans, max: 10, obtain: 0)
    if (@check.save)
      respond_to do |format|
        format.js {render partial: 'student_auth/abc'}
      end
    end
  end

  def view_sol_quiz
    @student_result = StudentResult.where('user_id=?', current_user.id).order(created_at: :desc)
  end
end
