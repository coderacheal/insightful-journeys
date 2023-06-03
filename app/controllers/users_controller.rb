class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_users = User.all
  end
  
  def show
      @user = User.find(params[:id])
      @recent_posts = @user.return_top_three
  end
  
end
