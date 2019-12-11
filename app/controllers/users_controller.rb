class UsersController < ApplicationController
      before_action :authenticate_user!, except: [:index,:show]
  def index
        @users = User.all.order(created_at: :desc)
        @users = User.all.page(params[:page]).per(5)
  end

  def show
        @user = User.find(params[:id])
        @posts = @user.posts.order(created_at: :desc)
        @posts = @user.posts.page(params[:page]).per(3)
        @favorite_posts = @user.favorite_posts.order(created_at: :desc)
        @favorite_posts = @user.favorite_posts.page(params[:page]).per(3)
  end
    
def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end
end
