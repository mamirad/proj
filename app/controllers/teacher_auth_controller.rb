class TeacherAuthController < ApplicationController
layout "custom_layouts/teacherlayout"
def home
end
def view_teacher_cources

@federal_teacher_cources = Adminteacher.where("teacher_email = ?", current_user.email).first.federal_cources

@punjab_teacher_cources = Adminteacher.where("teacher_email = ?", current_user.email).first.punjab_cources

end
def new_question

end
def create_question

@role = params[:role]

if @role.to_i == 0
@v1 = FMcq.create(email: current_user.email, federal_cource_id: params[:cource], q: params[:created_question][:q], o1: params[:created_question][:o1], o2: params[:created_question][:o2])# debugger
end
if @role.to_i == 1
@v1 = PMcq.create(email: current_user.email, punjab_cource_id: params[:cource], q: params[:created_question][:q], o1: params[:created_question][:o1], o2: params[:created_question][:o2])
end
respond_to do |format |
  format.js {
    render partial: 'teacher_auth/mcq'
  }
end
end

def view_mcqs

@fmcqs = FMcq.all.where('email=?', current_user.email)
@pmcqs = PMcq.all.where('email=?', current_user.email)

end
end