class GroupsController < ApplicationController
  layout "custom_layouts/adminlayout"
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index

    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new

    authorize Board.all
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit

  end

  # POST /groups
  # POST /groups.json
  def create
    Group.transaction do
      @group = Group.new(group_params)
      @group_exist = Group.where('name=?', params[:group][:name]).first

      @board_list = params[:group][:board_ids]

      respond_to do |format|
        if @group_exist.present?
          @board_list = @board_list.reject {|f| f == ""}
          @board_list.each do |boardid|
            @result = @group_exist.boardgroups.create(board_id: boardid, group_id: @group.id)
          end
          format.html {redirect_to @group, notice: 'Group was successfully created.'}
          format.json {render :show, status: :created, location: @group}
        else
          if @group.save
            @board_list = @board_list.reject {|f| f == ""}
            @board_list.each do |boardid|
              @result = @group.boardgroups.create(board_id: boardid, group_id: @group.id)
            end
            format.html {redirect_to @group, notice: 'Group was successfully created.'}
            format.json {render :show, status: :created, location: @group}
          else
            format.html {render :new}
            format.json {render json: @group.errors, status: :unprocessable_entity}
          end
        end

      end


    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update


    respond_to do |format|
      if @group.update(group_params)

        @result = Boardgroup.where('group_id=?', params[:id]).destroy_all

        @board_list = params[:group][:board_ids]

        @board_list.each do |a|
          puts "555" * 1000
          puts a
          @abc = @group.boardgroups.create(board_id: a, group_id: params[:id])
        end


        format.html {redirect_to @group, notice: 'Group was successfully updated.'}
        format.json {render :show, status: :ok, location: @group}
      else

        format.html {render :edit}
        format.json {render json: @group.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html {redirect_to groups_url, notice: 'Group was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).permit(:name)
  end
end
