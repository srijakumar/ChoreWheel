
class UsersController < ApplicationController
  before_action :authentication_required

def new
  @user = User.new
end

def create
  @user = User.new
  @user.email = params[:user][:email]
  @user.password = params[:user][:password]

  if @user.save
    session[:user_id] = @user_id

    redirect_to root_path
  else
    #byebug
    render 'users/new'
  end

  # def chores
  #   @chores=@user.chores
  #
  # end

end
end
