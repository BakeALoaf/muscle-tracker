class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save
      redirect_to root_path
    else
      render :new
    end
  end

  def session_params
    params.require(:session).permit(:workout)
  end
end
