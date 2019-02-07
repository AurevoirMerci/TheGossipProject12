class UserController < ApplicationController

  def show
    p params
    @user = User.find(params[:id])
  end

  def new
    @cities = []
        City.all.each do |city|
            @cities << [city.name, city.id]
        end
  end

 def create
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], age: params[:age], email: params[:email], password: params[:password], city_id: params[:city_id])

  if @user.save
  puts "le save a fonctionné"
  puts params.inspect

  redirect_to static_pages_home_path
  else 
    redirect_to new_user_path
    puts "le save n'a pas fonctionné"
    puts params.inspect
  end
end
end
