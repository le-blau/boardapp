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
end
