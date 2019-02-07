class GossipController < ApplicationController

  before_action :authenticate_user, only: [:index]

  def index
@gossips = Gossip.all
  end
  

  def show
    @gossips = Gossip.all
    @comment = Comment.new
  end


def new
   @gossips = Gossip.new
 end

def create

   @gossips = Gossip.new(title: params[:title], content: params[:content], user: current_user)
   if @gossips.save
      redirect_to static_pages_home_path
   else
     render :new
   end

   gossip_comment = Gossip.create

 end


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

      private


    def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end


end