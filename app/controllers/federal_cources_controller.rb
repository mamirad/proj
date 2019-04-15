class FederalCourcesController < ApplicationController
  layout "custom_layouts/federallayout"
  
  before_action :set_federal_cource, only: [:show, :edit, :update, :destroy]


  def view_federal_teachers
    @view_federal_teachers = FederalCource.find(params[:cource_id]).adminteachers 
  end
  def federal_teacher_mcqs
    
  @fmcqs = FMcq.where('email=?', params[:teacher_email]+'.com')

  end
  # GET /federal_cources
  # GET /federal_cources.json
  def index
    @federal_cources = FederalCource.all
  end

  # GET /federal_cources/1
  # GET /federal_cources/1.json
  def show
  end

  # GET /federal_cources/new
  def new
    
    @federal_cource = FederalCource.new
   authorize @current_user, :federal_user_auth?
  end

  # GET /federal_cources/1/edit
  def edit
  end

  # POST /federal_cources
  # POST /federal_cources.json
  def create
    @federal_cource = FederalCource.new(federal_cource_params)

    respond_to do |format|
      if @federal_cource.save
        format.html { redirect_to @federal_cource, notice: 'Federal cource was successfully created.' }
        format.json { render :show, status: :created, location: @federal_cource }
      else
        format.html { render :new }
        format.json { render json: @federal_cource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federal_cources/1
  # PATCH/PUT /federal_cources/1.json
  def update
    respond_to do |format|
      if @federal_cource.update(federal_cource_params)
        format.html { redirect_to @federal_cource, notice: 'Federal cource was successfully updated.' }
        format.json { render :show, status: :ok, location: @federal_cource }
      else
        format.html { render :edit }
        format.json { render json: @federal_cource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federal_cources/1
  # DELETE /federal_cources/1.json
  def destroy
    @federal_cource.destroy
    respond_to do |format|
      format.html { redirect_to federal_cources_url, notice: 'Federal cource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_cource
      @federal_cource = FederalCource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def federal_cource_params
      params.require(:federal_cource).permit(:cource_name, :group_id)
    end
end
