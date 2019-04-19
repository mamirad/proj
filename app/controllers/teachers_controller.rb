class TeachersController < ApplicationController
  layout "custom_layouts/adminlayout"
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  after_action :teacher_signup, only: [:create]


  # GET /teachers
  # GET /teachers.json
  def index

    @teachers = Teacher.all

  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show

  end

  # GET /teachers/new
  def new
    (authorize current_user) && (authorize Course.all)

    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    @course_list = params[:teacher][:course_ids]
    respond_to do |format|
      if @teacher.save

        # @course_list = @course_list.reject {|f| f == ""}
        # @course_list.each do |courseid|
        #   byebug
        #   @result = @teacher.teachercourses.create(course_id: courseid, teacher_id: @teacher.id)
        # end
        format.html {redirect_to @teacher, notice: 'Teacher was successfully created.'}
        format.json {render :show, status: :created, location: @teacher}
      else
        format.html {render :new}
        format.json {render json: @teacher.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        # @result = Teachercourse.where('teacher_id=?', params[:id]).destroy_all
        # @course_list = params[:teacher][:course_ids]
        #
        # @course_list = @course_list.reject {|f| f == ""}
        # @course_list.each do |courseid|
        #   @result = @teacher.teachercourses.create(course_id: courseid, teacher_id: @teacher.id)
        # end


        format.html {redirect_to @teacher, notice: 'Teacher was successfully updated.'}
        format.json {render :show, status: :ok, location: @teacher}
      else
        format.html {render :edit}
        format.json {render json: @teacher.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html {redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def teacher_mcqs
    @teacher_courses = Teacher.find(params[:teacher_id]).teachercourses
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def teacher_signup
    @teacher = User.create(email: params[:teacher][:email], name: params[:teacher][:name], password: 'aaaaaa', role: 1)

  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:name, :age, :phone, :email, course_ids:[])
  end
end
