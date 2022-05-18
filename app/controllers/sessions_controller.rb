class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show, :create, :new]
  before_action :set_session, only: [:show, :destroy, :update] #except: [:index, :create]

  def index
    @sessions = Session.order(:title)
  end

  def show
  end

  def new
    @session = Session.new
    # These following instance variables so the list collection_selector works in new session form
    @gamemasters = Gamemaster.all
    @games = Game.all
    @players = Player.all
  end

  def create
    session = Session.create!(session_params)
    redirect_to session
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

  def session_params
    return params.require(:session).permit(:title, :gamemaster_id, :player_id, :game_id)
  end
end
