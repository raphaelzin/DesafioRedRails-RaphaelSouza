class UsersController < ApplicationController

  before_action :check_identity, only: [:edit, :update, :home]

  def home
    if current_user.present?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def history
  end

  def yourRooms
  end

  def offers
  end

  def show
    @user = User.find(params[:id])
  end

  def answer_request
    @request = Request.find(params[:request_id])
    @room = @request.room
    @user = @request.user

    if params[:answer]
      @history = RentHistory.new
      
      @history.room = @room 
      @history.user = @user
      @history.in = @request.in
      @history.out = @request.out

      @user.rent_histories << @history
      flash[:success] = "Your room has been rented to #{@user.name}"
    else
      flash[:success] = "Request denied"
    end
    
    @request.destroy
    redirect_to users_home_path
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
      redirect_to root_path
    end
  end

  def check_identity
    if not current_user.present? or current_user != User.find(params[:id])
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :email, :desc, :picture)
  end
end
