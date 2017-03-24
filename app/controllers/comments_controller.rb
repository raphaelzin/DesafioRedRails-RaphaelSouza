class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_params)
	    if @comment.save!
	      flash[:success] = "Comment successfully posted"
	      redirect_to :back
	    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash[:success] = 'Comment successfully removed'
		redirect_to :back
	end

	def comment_params
	    params.require(:comment).permit(:text, :room_id, :user_id)
	end
end
