class AdminteachersController < ApplicationController
  layout "custom_layouts/adminlayout"
  before_action :set_adminteacher, only: [:show, :edit, :update, :destroy]
  after_action :teacher_signup, only: [:create]
  



  # GET /adminteachers
  # GET /adminteachers.json
  def index
    @adminteachers = Adminteacher.all
  end

  # GET /adminteachers/1
  # GET /adminteachers/1.json
  def show
    #authorize(@adminteacher)
  
  end

  # GET /adminteachers/new
  def new
    
    authorize(FederalCource.all) && authorize(PunjabCource.all)
    @adminteacher = Adminteacher.new
  end

  # GET /adminteachers/1/edit
  def edit
  end

  # POST /adminteachers
  # POST /adminteachers.json
  def create

    @adminteacher = Adminteacher.new(adminteacher_params)

    respond_to do |format|
      if @adminteacher.save
         
           @cource_lists= params[:adminteacher][:federal_cource_ids]
            @cource_lists.each do|cource_list|
              @adminteacher.federal_cource_teachers.create(adminteacher_id:params[:id],federal_cource_id:cource_list)
              # @teacher.teacher_groups.create(teacher_id:params[:id],group_id:group_list)
             
              end     
                @cource_lists= params[:adminteacher][:punjab_cource_ids]
            @cource_lists.each do|cource_list|
              @adminteacher.punjab_cource_teachers.create(adminteacher_id:params[:id],punjab_cource_id:cource_list)
              # @teacher.teacher_groups.create(teacher_id:params[:id],group_id:group_list)
             
              end   

           

        format.html { redirect_to @adminteacher, notice: 'Adminteacher was successfully created.' }
        format.json { render :show, status: :created, location: @adminteacher }
      else
        format.html { render :new }
        format.json { render json: @adminteacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminteachers/1
  # PATCH/PUT /adminteachers/1.json
  def update
    respond_to do |format|
      if @adminteacher.update(adminteacher_params)
        format.html { redirect_to @adminteacher, notice: 'Adminteacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @adminteacher }
      else
        format.html { render :edit }
        format.json { render json: @adminteacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminteachers/1
  # DELETE /adminteachers/1.json
  def destroy
    @adminteacher.destroy
    respond_to do |format|
      format.html { redirect_to adminteachers_url, notice: 'Adminteacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminteacher
      @adminteacher = Adminteacher.find(params[:id])
    end
      private
  def teacher_signup
    User.create(email: params[:adminteacher][:teacher_email], name: params[:adminteacher][:teacher_name],role: 'teacher', password: 'aaaaaa' )
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def adminteacher_params
      params.require(:adminteacher).permit(:teacher_name, :teacher_email,:federal_cource_id)
    end
end
