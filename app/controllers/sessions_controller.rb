class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    if current_user
     session.delete :user_id
     redirect_to root_url
    end
  end

end
