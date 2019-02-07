class GossipController < ApplicationController
  def show
      p params
    @gossips = Gossip.all
    @comment = Comment.new
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

   gossip_comment = Gossip.create

 end
	# essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    #else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    #end

    def index
    	@gossips = Gossip.all
    end

    def edit
      @gossips = Gossip.find(params[:id])
    end

    def update
      @gossips = Gossip.find(params[:id])
      gossips_params = params.require(:gossip).permit(:title, :content)
      @gossips.update(gossips_params)
      redirect_to gossip_path
    end 

    def destroy
      @gossips = Gossip.find(params[:id])
      @gossips.destroy
      redirect_to static_pages_home_path
    end

end