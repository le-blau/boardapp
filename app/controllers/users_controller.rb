class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
      )
    if @user.save
      flash[:notice] = "登録しました"
      redirect_to("/users/index")
    else
      flash[:alert] = "不正な入力です"
      render("users/new")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/users/index")
    else
      flash[:alert] = "不正な入力です"
      render("users/edit")
    end
  end

end
