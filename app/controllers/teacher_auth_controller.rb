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

  def view_mcqs
    @question_paper = Teachercourse.find(params[:teachercource]).question_papers
    # byebug
  end

  def edit_mcq
    @mcq = Mcq.find(params[:mcq_id])
  end

  def update_mcq
    @mcq = Mcq.find(params[:mcq_id])
    @mcqparams = params.require(:mcq).permit(:question, :option1, :option2, :option3, :option4, :option5, :option6)

   if  @mcq.update(@mcqparams )

     redirect_to show_mcq_path(@mcq)

   end
  end
  def show_mcq
    @mcq= Mcq.find(params[:mcq_id])
  end
  def delete_mcq
    @mcq = Mcq.find(params[:mcq_id])
    @mcq.destroy
    redirect_to view_teacher_cources_path
  end

  def mcq_params

    params.require(:new_mcq).permit(:question, :option1, :option2, :option3, :option4, :option5, :option6)

  end
end
