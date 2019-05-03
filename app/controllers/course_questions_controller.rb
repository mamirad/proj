class CourseQuestionsController < ApplicationController
  layout 'custom_layouts/teacherlayout'
  before_action :set_course_question, only: [:show, :edit, :update, :destroy]

  # GET /course_questions
  # GET /course_questions.json
  def index
    @course_questions = CourseQuestion.all
  end

  # GET /course_questions/1
  # GET /course_questions/1.json
  def show
  end

  # GET /course_questions/new
  def new
    @course_question = CourseQuestion.new
    session[:teachercourseid] = params[:teachercourse]

  end

  # GET /course_questions/1/edit
  def edit
  end

  # POST /course_questions
  # POST /course_questions.json
  def create
    @course_question = CourseQuestion.new(course_question_params)
    @course_question.teachercourse_id = session[:teachercourseid]

    respond_to do |format|
      if @course_question.save
        format.html {redirect_to @course_question, notice: 'Course question was successfully created.'}
        format.json {render :show, status: :created, location: @course_question}
      else
        format.html {render :new}
        format.json {render json: @course_question.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /course_questions/1
  # PATCH/PUT /course_questions/1.json
  def update
    respond_to do |format|
      if @course_question.update(course_question_params)
        format.html {redirect_to @course_question, notice: 'Course question was successfully updated.'}
        format.json {render :show, status: :ok, location: @course_question}
      else
        format.html {render :edit}
        format.json {render json: @course_question.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /course_questions/1
  # DELETE /course_questions/1.json
  def destroy
    @course_question.destroy
    respond_to do |format|
      format.html {redirect_to course_questions_url, notice: 'Course question was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course_question
    @course_question = CourseQuestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_question_params
    params.require(:course_question).permit(:question, :answer, :option1, :option2, :option3, :option4, :option5, :questiontype, :teachercourse_id)
  end
end
