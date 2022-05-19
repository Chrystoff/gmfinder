class GamemastersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth
  before_action :set_gamemaster, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  # before_action :set_foreigns, only: [:new, :edit]

  def index
    @gamemasters = Gamemaster.order(:name)
  end

  def show
  end

  def new
    @gamemaster = Gamemaster.new
  end

  def create
    gamemaster = Gamemaster.create!(gamemaster_params)
    redirect_to gamemaster
  end

  def edit
  end

  def update
    @gamemaster.update(gamemaster_params)
    redirect_to @gamemaster
  end
  
  def destroy
    @gamemaster.destroy
    redirect_to gamemasters_path
  end

  private

  def check_auth
    authorize Gamemaster
  end

  def set_gamemaster
    @gamemaster = Gamemaster.find(params[:id])
  end
  
  # def set_foreigns
  #   @games = Game.all
  #   @sessions = Session.all
  #   @players = Player.all
  # end

  def gamemaster_params
    return params.require(:gamemaster).permit(:name)
  end
end
