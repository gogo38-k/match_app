class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
	before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :profile, :password_confirmation, :image)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
