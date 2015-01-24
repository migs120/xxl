class CommentsController < ApplicationController
  
  respond_to :html, :js
  
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
     def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     @topic = @post.topic
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     #  redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       # redirect_to [@topic, @post]
     end
       
            respond_with(@comment) do |format|
       format.html { redirect_to [@post.topic, @post] }
     end
       
   end

end



