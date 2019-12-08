class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]
    
  def new
          @post = Post.new
  end
    
            def edit
               @post = Post.find_by(id: params[:id])
    end
    
        def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            render 'edit'
     else
        #    render plain: @post.erros.inspect
            render 'edit'
        end
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
        @user = @post.user
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/")
  end
    
    private
        def post_params
            params.require(:post).permit(
                :body,
                :title,
                :second_title,
                :second_body,
                :second_link,
                :image
                
                
                ).merge(user_id: current_user.id)
        end
    
end
