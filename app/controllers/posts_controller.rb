class PostsController < ApplicationController
  before_action :authenticate_user, {only:[:index, :show, :edit, :update]}

  def index
    if params[:searchword].blank?
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.search(params[:searchword]).order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "不正な入力です"
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      flash[:alert] = "不正な入力です"
      render("posts/edit")
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end

end
