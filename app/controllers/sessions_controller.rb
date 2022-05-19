class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_session, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  before_action :set_foreigns, only: [:new, :edit]

  def index
    @sessions = Session.order(:title)
  end

  def show
  end

  def new
    @session = Session.new
  end

  def create
    session = Session.create!(session_params)
    redirect_to session
  end

  def edit
  end

  def update
    @session.update(session_params)
    redirect_to @session
  end
  
  def destroy
    @session.destroy
    redirect_to sessions_path
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def set_foreigns
    @gamemasters = Gamemaster.all
    @games = Game.all
    @players = Player.all
  end

  def session_params
    return params.require(:session).permit(:title, :gamemaster_id, :player_id, :game_id)
  end
end
