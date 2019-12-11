class PostsController < ApplicationController
before_action :authenticate_user!, except: [:index]
    
  def new
      @post = Post.new
       @post = current_user.posts.build
  end
    
    def edit
               @post = Post.find_by(id: params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
    if @post.update(post_params)
            flash[:notice] = "投稿が保存されました"
           # render 'edit'
            render "edit"
     else
            flash[:alert] = "注意事項を確認！"
        #    render plain: @post.erros.inspect
            render 'edit'
        end
    end
    
      def create
        @post = current_user.posts.build(post_params)
        @post.user_id = current_user.id
        if @post.save

          redirect_to "/posts/#{@post.id}"
          flash[:notice] = "投稿が保存されました"
        else
            
          #flash[:notice] = "投稿"
          flash[:alert] = "注意事項を確認！"
          render("posts/new")
        end
    end

  def index
      @posts = Post.all.order(created_at: :desc)
      @posts = Post.page(params[:page]).per(5)
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
                :title,
                :body,
                :image,
                
                :second_title,
                :second_body,
                :second_link,
                :second_image,
                
                :third_title,
                :third_body,
                :third_link,
                :third_image,
                
                :fourth_title,
                :fourth_body,
                :fourth_link,
                :fourth_image,
                
                :fifth_title,
                :fifth_body,
                :fifth_link,
                :fifth_image,
                
                :sixth_title,
                :sixth_body,
                :sixth_link,
                :sixth_image,
                
                ).merge(user_id: current_user.id)
        end

end
