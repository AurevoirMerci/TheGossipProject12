class CityController < ApplicationController
	
	def index
		@city = City.all
		@gossips = Gossip.all
	end


	def show
				p params.inspect

		@city = City.find(params[:id])
		@users = User.where(city: params[:id])
		@gossips = Gossip.where(user: @users.ids)
	end
end
