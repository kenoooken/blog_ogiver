class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]
    
  def new
          @post = Post.new
  end
    
def create
      
    @post = Post.new(post_params)  
    @post.user_id = current_user.id 
    @post.save
    redirect_to posts_path
      
  end

  def index
          @posts = Post.all
  end

  def show
          @post = Post.find(params[:id])
  end


private
    def post_params
      params.require(:post).permit(:body) # tweetモデルのカラムのみを許可
    end
    
end
