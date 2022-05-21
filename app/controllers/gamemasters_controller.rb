class GamemastersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth
  before_action :set_gamemaster, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  before_action :set_foreigns, only: [:new, :edit, :create, :update]

  def index
    @gamemasters = Gamemaster.order(:name)
  end

  def show
  end

  def new
    @gamemaster = Gamemaster.new
  end

  def create
    @gamemaster = Gamemaster.create(gamemaster_params)
    if @gamemaster.valid?
      redirect_to @gamemaster
    else
      flash.now[:alert] = @gamemaster.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @gamemaster = Gamemaster.new(gamemaster_params)
      @gamemaster.save!
      redirect_to @gamemaster
    rescue
      flash.now[:alert] = @gamemaster.errors.full_messages.join('<br>')
      render 'edit'
    end
  end
  
  def destroy
    @gamemaster.profilepic.purge
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
  
  def set_foreigns
    @games = Game.all
    @sessions = Session.all
    @players = Player.all
  end

  def gamemaster_params
    return params.require(:gamemaster).permit(:name, :profilepic, :experience, :availability, :about)
  end
end
