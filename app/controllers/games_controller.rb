class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth
  before_action :set_game, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  # before_action :set_foreigns, only: [:new, :edit]

  def index
    @games = Game.order(:name)
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create!(game_params)
    redirect_to game
  end

  def edit
  end

  def update
    @game.update(game_params)
    redirect_to @game
  end
  
  def destroy
    @game.cover.purge
    @game.destroy
    redirect_to games_path
  end

  private

  def check_auth
    authorize Game
  end

  def set_game
    @game = Game.find(params[:id])
  end

  # def set_foreigns
  #   @gamemasters = Gamemaster.all
  #   @sessions = Session.all
  #   @players = Player.all
  # end

  def game_params
    return params.require(:game).permit(:name, :cover)
  end
end
