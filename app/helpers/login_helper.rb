module LoginHelper


   def current_user
    User.find_by(id: session[:user_id])
  end

   def log_in(user)
    login[:user_id] = user.id
 end


end
