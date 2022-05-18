class GamemastersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gamemaster, only: [:show]

  def index
    @gamemasters = Gamemaster.order(:name)
  end

  def show
  end

  private

  def set_gamemaster
    @gamemaster = Gamemaster.find(params[:id])
  end
end
