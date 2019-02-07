class LoginController < ApplicationController

def new
end

def create
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
  	session[:user_id] = user.id

 #login[:user_id] = user.id
  session#(user)
  redirect_to static_pages_home_path
  else
  redirect_to new_login_path
  end
end

def destroy
  session.clear
end

def show
	  session.clear
	  redirect_to static_pages_home_path
end 


end
