class TeacherAuthController < ApplicationController
  layout "custom_layouts/teacherlayout"

  def home
  end

  def view_teacher_cources

    @user_email = current_user.email

    @teacher_courses = Teacher.where("email=?", @user_email).first.teachercourses


  end

  def new_mcq

  end

  def create_mcq

    @result = Mcq.new(mcq_params)
    @result.teachercourse_id = params[:teachercource]
    if @result.save
      flash[:mcq] = 'mcq has been created'
      redirect_to new_mcq_path
    end


  end

  def view_questions
    @course_questions = Teachercourse.find(params[:teachercource]).course_questions
    # byebug
  end

  def view_quizs
    @qquizs = Teachercourse.find(params[:teachercource]).qquizs
  end

  def edit_mcq
    @mcq = Mcq.find(params[:mcq_id])
  end

  def update_mcq
    @mcq = Mcq.find(params[:mcq_id])
    @mcqparams = params.require(:mcq).permit(:question, :option1, :option2, :option3, :option4, :option5, :option6)

    if @mcq.update(@mcqparams)

      redirect_to show_mcq_path(@mcq)

    end
  end

  def show_mcq
    @mcq = Mcq.find(params[:mcq_id])
  end

  def delete_mcq
    @mcq = Mcq.find(params[:mcq_id])
    @mcq.destroy
    redirect_to view_teacher_cources_path
  end
  def mark_quiz
@teacher_quiz_questions=Qquiz.find(params[:quiz]).quizquestions
    # byebug
  end
  def update_quiz_marks
    byebug
    respond_to do |format|
      format.js{render partial: 'teacher_auth/update_quiz_marks'}

    end
  end

  def mcq_params

    params.require(:new_mcq).permit(:question, :option1, :option2, :option3, :option4, :option5, :option6)

  end
end
