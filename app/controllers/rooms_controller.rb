class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @room = Room.find(params[:id])
    @pic = Picture.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = params[:user_id]
    if @room.save!
      flash[:success] = "Room listed!"

      redirect_to users_home_path
    else
      flash[:error] = "error"
      redirect_to users_home_path
    end
  end

  def request_room
    @room = Room.find(params[:room_id])
    @user = User.find(params[:user_id])
    @in = params[:check_in]
    @out = params[:check_out]

    @request = Request.new
    @request.room_id = @room.id
    @request.user_id = @user.id
    @request.in = params[:check_in][0].to_date.beginning_of_day
    @request.out = params[:check_out][0].to_date.end_of_day
    if @request.save!
      flash[:success] = "You requested the room"
    end
    redirect_to room_path(@room)

  end

  def index

    if (params[:check_in].present? and params[:check_in][0] != "") && (params[:check_out].present? and params[:check_out][0] != "")
      @start_date = params[:check_in][0].to_date.beginning_of_day
      @end_date = params[:check_out][0].to_date.end_of_day

      # Atribuição paralela para o caso de datas trocadas 
      if @start_date > @end_date
        @start_date,@end_date = @end_date,@start_date
      end

      session[:in] = @start_date
      session[:out] = @end_date

      session[:nights] = (((@end_date - @start_date).to_i)/1.day).abs
    end

    params[:check_in] = nil
    params[:check_out] = nil
  end

  def home
    @user = User.new
  end

  def room_params
    params.require(:room).permit(:title, :address, :desc, :guests, :beds, :price, :lat, :lon, :user_id, :available, :pictures)
  end
end
