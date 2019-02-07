class LoginController < ApplicationController

def new
end

def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])
  p user.inspect 
  p user.authenticate(params[:password])
  p "****************************************"

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
  redirect_to static_pages_home_path
 p "Gagné !!!"
    # redirige où tu veux, avec un flash ou pas

  else
  redirect_to new_login_path
    puts "Perdu !!!!! "
  end
end


end
