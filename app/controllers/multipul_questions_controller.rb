class MultipulQuestionsController < ApplicationController
  layout "custom_layouts/teacherlayout"
  before_action :set_multipul_question, only: [:show, :edit, :update, :destroy]

  # GET /multipul_questions
  # GET /multipul_questions.json
  def index
    @multipul_questions = MultipulQuestion.all
  end

  # GET /multipul_questions/1
  # GET /multipul_questions/1.json
  def show
  end

  # GET /multipul_questions/new
  def new
    @multipul_question = MultipulQuestion.new
    session[:teachercourse]=params[:teachercourse]

  end

  # GET /multipul_questions/1/edit
  def edit
  end

  # POST /multipul_questions
  # POST /multipul_questions.json
  def create
    @multipul_question = MultipulQuestion.new(multipul_question_params)
    @multipul_question.teachercourse_id=session[:teachercourse]


    respond_to do |format|
      if @multipul_question.save
        format.html { redirect_to @multipul_question, notice: 'Multipul question was successfully created.' }
        format.json { render :show, status: :created, location: @multipul_question }
      else
        format.html { render :new }
        format.json { render json: @multipul_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multipul_questions/1
  # PATCH/PUT /multipul_questions/1.json
  def update
    respond_to do |format|
      if @multipul_question.update(multipul_question_params)
        format.html { redirect_to @multipul_question, notice: 'Multipul question was successfully updated.' }
        format.json { render :show, status: :ok, location: @multipul_question }
      else
        format.html { render :edit }
        format.json { render json: @multipul_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multipul_questions/1
  # DELETE /multipul_questions/1.json
  def destroy
    @multipul_question.destroy
    respond_to do |format|
      format.html { redirect_to multipul_questions_url, notice: 'Multipul question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multipul_question
      @multipul_question = MultipulQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multipul_question_params

      params.require(:multipul_question).permit(:question, :option1, :option2, :option3, :option4, :option5, :option6, :teachercourse_id)

    end
end
