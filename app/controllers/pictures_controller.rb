class PicturesController < ApplicationController
	before_action :lookup_room

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.room_id = @room.id

		if @picture.save
		  flash[:success] = 'Picture Registered'
		  redirect_to room_path(@room)
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		flash[:success] = 'Picture successfully removed'
		redirect_to :back
	end

	def picture_params
		params.require(:picture).permit(:sub, :picture, :room_id)
	end
	
	def lookup_room
	  @room = Room.find(params[:room_id])
	end
end
