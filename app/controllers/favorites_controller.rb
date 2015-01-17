class FavoritesController < ApplicationController
     def create
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: @post)
 
     if favorite.save
       flash[:notice] = "Favorite was saved."
       redirect_to [@post.topic, @post]
     else
        flash[:error] = "Please try again. Could not add to favorites"
        redirect_to [@post.topic, @post] 
     end
   end
  
     def destroy
     @post = Post.find(params[:post_id])
     favorite = current_user.favorites.find(params[:id])

     authorize favorite
 
   if favorite.destroy
     flash[:success] = "Removed Favorite."
     redirect_to [@post.topic, @post]
   else
     flash[:error] = "Could not remove. Please try again."
     redirect_to = [@post.topic, @post]
   end
 end
  
  
end
