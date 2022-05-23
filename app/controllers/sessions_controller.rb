class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth
  before_action :set_session, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  before_action :set_foreigns, only: [:new, :edit, :create, :update]

  def index
    @sessions = Session.order(:title)
  end

  def show
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.create(session_params)
    if @session.valid?
      redirect_to @session
    else
      flash.now[:alert] = @session.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @session.update!(session_params)
      redirect_to @session
    rescue
      flash.now[:alert] = @session.errors.full_messages.join('<br>')
      render 'edit'
    end
  end
  
  def destroy
    @session.material.purge
    @session.destroy
    redirect_to sessions_path
  end

  private

  def check_auth
    authorize Session
  end

  def set_session
    @session = Session.find(params[:id])
  end

  def set_foreigns
    @gamemasters = Gamemaster.all
    @games = Game.all
    @players = Player.all
  end

  def session_params
    return params.require(:session).permit(:title, :material, :gamemaster_id, :player_id, :game_id, :time, :length, :description)
  end
end
