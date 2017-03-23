class UsersController < ApplicationController

  def home
  end

  def history
  end

  def yourRooms
  end

  def offers
  end

  def show
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      @user.save
      flash[:success] = "User edited"
      redirect_to users_home_path
    else
      redirect_to :back
    end
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      session[:user_id] = @user.id
      redirect_to rooms_home_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :desc, :picture)
  end
end
