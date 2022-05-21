class PlayersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_auth
  before_action :set_player, only: [:show, :destroy, :update, :edit] #except: [:index, :create]
  before_action :set_foreigns, only: [:new, :edit, :create, :update]

  def index
    @players = Player.order(:name)
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.create(player_params)
    if @player.valid?
      redirect_to @player
    else
      flash.now[:alert] = @player.errors.full_messages.join('<br>')
      render 'new'
    end
  end

  def edit
  end

  def update
    begin
      @player = Player.new(player_params)
      @player.save!
      redirect_to @player
    rescue
      flash.now[:alert] = @player.errors.full_messages.join('<br>')
      render 'edit'
    end
  end
  
  def destroy
    @player.profilepic.purge
    @player.destroy
    redirect_to players_path
  end

  private

  def check_auth
    authorize Player
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def set_foreigns
    @gamemasters = Gamemaster.all
    @games = Game.all
    @sessions = Session.all
  end

  def player_params
    return params.require(:player).permit(:name, :profilepic, :experience, :availability, :about)
  end
end
