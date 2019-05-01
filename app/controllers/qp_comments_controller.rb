class QpCommentsController < ApplicationController
  #layout "custom_layouts/adminlayout"
  layout :determine_layout
  before_action :set_qp_comment, only: [:show, :edit, :update, :destroy]

  # GET /qp_comments
  # GET /qp_comments.json
  def index
    @qp_comments = User.find(current_user.id).qp_comments
  end

  # GET /qp_comments/1
  # GET /qp_comments/1.json
  def show
  end

  # GET /qp_comments/new
  def new
    @qp_comment = QpComment.new
    session[:qp_id]=params[:qp_id]
  end

  # GET /qp_comments/1/edit
  def edit
  end

  # POST /qp_comments
  # POST /qp_comments.json
  def create
    @qp_comment = QpComment.new(qp_comment_params)
    @qp_comment.question_paper_id=session[:qp_id]
    @qp_comment.user_id=current_user.id
    respond_to do |format|
      if @qp_comment.save
        format.html { redirect_to @qp_comment, notice: 'Qp comment was successfully created.' }
        format.json { render :show, status: :created, location: @qp_comment }
      else
        format.html { render :new }
        format.json { render json: @qp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qp_comments/1
  # PATCH/PUT /qp_comments/1.json
  def update
    respond_to do |format|
      if @qp_comment.update(qp_comment_params)
        format.html { redirect_to @qp_comment, notice: 'Qp comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @qp_comment }
      else
        format.html { render :edit }
        format.json { render json: @qp_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qp_comments/1
  # DELETE /qp_comments/1.json
  def destroy
    @qp_comment.destroy
    respond_to do |format|
      format.html { redirect_to qp_comments_url, notice: 'Qp comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qp_comment
      @qp_comment = QpComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qp_comment_params
      params.require(:qp_comment).permit(:comment, :status, :question_paper_id)
    end


  def determine_layout
    #byebug
    case current_user.role

    when 'admin' #compare to 1
      # 'custom_layouts/adminlayout'
      "custom_layouts/adminlayout"
    when 'proof_reader' #compare to 2
      "custom_layouts/proof_reader"

    end
  end


end
