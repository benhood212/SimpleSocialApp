class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash[:alert] = "User not found"
      redirect_to root_path
    else
      @posts = @user.posts
    end
  end
end
