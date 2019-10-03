class PostsController < ApplicationController
  before_action :redirect_to_action, except: :index

  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
    if post
      flash[:notice] = "投稿を編集しました"
      redirect_to root_path
    else
      flash.now[:alert] = "編集に失敗しました。"
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  def redirect_to_action
    redirect_to "index" unless user_signed_in?
  end
end
