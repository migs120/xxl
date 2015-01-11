class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments

    @comment = current_user.comments.build(params.require(:comment).permit(:body))
    @comment.post = @post
    @new_comment = Comment.new

    #authorize @comment

   if @comment.save
      #flash[:notice] = "Comment was created."
     redirect_to [@topic, @post ], notice: 'Comment was saved successfully.'
    else
      redirect_to [@topic, @post ], notice: "There was an error saving the comment. Please try again."
    end

   
    end

end



