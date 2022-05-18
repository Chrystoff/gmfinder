class GamesController < ApplicationController
  # skip_before_action :verify_authenticity_token # DELETE THIS LATER
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_game, only: [:show]

  def index
    @games = Game.order(:name)
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
