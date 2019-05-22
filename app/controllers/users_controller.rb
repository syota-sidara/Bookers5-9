class UsersController < ApplicationController
  before_action :authenticate_user!
   def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @bboks = @user.books.order(created_at: :desc)
  end

  def index
  	@book = Book.new
    @user = current_user
    @users = User.all.order(created_at: :desc)
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have creatad book successfully."
  	  redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image,:introduction)
  end

end
