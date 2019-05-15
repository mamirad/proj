class QquizzesController < ApplicationController
  layout "custom_layouts/teacherlayout"
  before_action :set_qquiz, only: [:show, :edit, :update, :destroy]

  # GET /qquizzes
  # GET /qquizzes.json
  def index

    @qquizzes = Qquiz.all
  end

  # GET /qquizzes/1
  # GET /qquizzes/1.json
  def show
  end

  # GET /qquizzes/new
  def new

    @qquiz = Qquiz.new
    session[:teachercourse]=params[:teachercourse]



  end

  # GET /qquizzes/1/edit
  def edit
  end

  # POST /qquizzes
  # POST /qquizzes.json
  def create
    @qquiz = Qquiz.new(qquiz_params)
@qquiz.teachercourse_id=session[:teachercourse]
# byebug
    respond_to do |format|
      if @qquiz.save

        format.html { redirect_to @qquiz, notice: 'Qquiz was successfully created.' }
        format.json { render :show, status: :created, location: @qquiz }
      else
        format.html { render :new }
        format.json { render json: @qquiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qquizzes/1
  # PATCH/PUT /qquizzes/1.json
  def update
    respond_to do |format|
      if @qquiz.update(qquiz_params)
        format.html { redirect_to @qquiz, notice: 'Qquiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @qquiz }
      else
        format.html { render :edit }
        format.json { render json: @qquiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qquizzes/1
  # DELETE /qquizzes/1.json
  def destroy
    @qquiz.destroy
    respond_to do |format|
      format.html { redirect_to qquizzes_url, notice: 'Qquiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qquiz
      @qquiz = Qquiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qquiz_params
      params.require(:qquiz).permit(:expire_date, :teachercourse_id,course_question_ids:[])
    end
end
