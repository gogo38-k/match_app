class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :following, :followers]
	before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
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
      log_in @user
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to @user
    else
      render 'edit'
    end
  end


  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :profile, :password_confirmation, :image, :team)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    
end
