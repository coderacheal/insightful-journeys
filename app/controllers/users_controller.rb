class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_users = User.all
  end
  
  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to root_path
    else
      @user = User.find(params[:id])
      @recent_posts = @user.return_top_three
    end
  end
  
end
