class GuestUserController < ApplicationController

  def login
    @user = User.find_by(email: "test@example.com")
    flash[:notice] = "ゲストとしてログインしました"
    session[:user_id] = @user.id
    redirect_to("/posts/index")
  end
end
