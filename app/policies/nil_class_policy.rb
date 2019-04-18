class NilClassPolicy
  attr_reader :user, :record
  # before_action :set_federal_cource, only: [:show, :edit, :update, :destroy]

  def initialize(user, record)
    @user = user
    @record = record
  end

  def federal_user_auth?

  	
  	@user.role=='federal'

  end
  def boardgroup_exist?
    Boardgroup.all.any?
  end

  # def index?
  #   false
  # end

  # def show?
  #   false
  #   # debugger
   
  #     #redirect_to root_path, warning: "You are not authorized" unless @user.role == "admin"
  # end

  # def create?
  #  false
  # end

  # def new?
  #   create?
  # end

  # def update?
  #   false
  # end

  # def edit?
  #   update?
  # end

  # def destroy?
  #   false
  # end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
