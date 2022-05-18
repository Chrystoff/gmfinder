class SessionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_session, only: [:show]

  def index
    @sessions = Session.order(:title)
  end

  def show
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end
end
