class CommentsController < ApplicationController

	def new
		@comment = Comment.new
	end

	def create
		@video = Video.find(params[:video_id])
		@comment = @video.comments.create(params[:comment])
		redirect_to video_path(@video)

		@comment = Comment.new(comment_params)

		if @comment.save
			flash[:success] = 'Your comment was successfully posted'
			redirect_to root_url
		else
			render 'new'
		end
	end	

	private 

	def comment_params
		params.require(:comment).permit(:title, :body, :user_id)
	end
end
