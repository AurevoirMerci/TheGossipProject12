class GossipController < ApplicationController
  def show
    @gossips = Gossip.all
  end

    #@gossips = Gossip.new(params) # avec xxx qui sont les données obtenues à partir du formulaire
    #puts params

def new
   @gossips = Gossip.new
 end

def create
	p params

   @gossips = Gossip.new(title: params[:title], content: params[:content], user: User.all.sample)
   if @gossips.save
     render :home
   else
     render :new
   end
 end
	# essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    #else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    #end

    def index
    	@gossips = Gossip.all
    end

end