class PunjabCourcesController < ApplicationController
  before_action :set_punjab_cource, only: [:show, :edit, :update, :destroy]
  layout "custom_layouts/punjablayout"

  def home
  end


  def view_punjab_teachers
    @view_punjab_teachers = PunjabCource.find(params[:cource_id]).adminteachers 
  end
  def federal_teacher_mcqs
    
  @fmcqs = FMcq.where('email=?', params[:teacher_email]+'.com')

  end



  # GET /punjab_cources
  # GET /punjab_cources.json
  def index
    @punjab_cources = PunjabCource.all
  end

  # GET /punjab_cources/1
  # GET /punjab_cources/1.json
  def show
  end

  # GET /punjab_cources/new
  def new
    @punjab_cource = PunjabCource.new
  end

  # GET /punjab_cources/1/edit
  def edit
  end

  # POST /punjab_cources
  # POST /punjab_cources.json
  def create
    @punjab_cource = PunjabCource.new(punjab_cource_params)

    respond_to do |format|
      if @punjab_cource.save
        format.html { redirect_to @punjab_cource, notice: 'Punjab cource was successfully created.' }
        format.json { render :show, status: :created, location: @punjab_cource }
      else
        format.html { render :new }
        format.json { render json: @punjab_cource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /punjab_cources/1
  # PATCH/PUT /punjab_cources/1.json
  def update
    respond_to do |format|
      if @punjab_cource.update(punjab_cource_params)
        format.html { redirect_to @punjab_cource, notice: 'Punjab cource was successfully updated.' }
        format.json { render :show, status: :ok, location: @punjab_cource }
      else
        format.html { render :edit }
        format.json { render json: @punjab_cource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /punjab_cources/1
  # DELETE /punjab_cources/1.json
  def destroy
    @punjab_cource.destroy
    respond_to do |format|
      format.html { redirect_to punjab_cources_url, notice: 'Punjab cource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_punjab_cource
      @punjab_cource = PunjabCource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def punjab_cource_params
      params.require(:punjab_cource).permit(:cource_name, :group_id)
    end
end
