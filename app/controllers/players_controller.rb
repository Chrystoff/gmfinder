class PlayersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_player, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  # before_action :set_foreigns, only: [:new, :edit]

  def index
    @players = Player.order(:name)
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.create!(player_params)
    redirect_to player
  end

  def edit
  end

  def update
    @player.update(player_params)
    redirect_to @player
  end
  
  def destroy
    @player.destroy
    redirect_to players_path
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  # def set_foreigns
  #   @gamemasters = Gamemaster.all
  #   @games = Game.all
  #   @sessions = Session.all
  # end

  def player_params
    return params.require(:player).permit(:name)
  end
end
