class SessionsController < ApplicationController

def new

end

def create
  user = User.find_by(:email => params[:email])
  cookies[:email]=user.email
end

end
