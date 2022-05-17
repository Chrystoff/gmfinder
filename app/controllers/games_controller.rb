class GamesController < ApplicationController
  # skip_before_action :verify_authenticity_token # DELETE THIS LATER
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end
end
