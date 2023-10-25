class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.created_at = Time.current
    @session.user = current_user
    if @session.save
      redirect_to trackers_path
    else
      puts "Session errors: #{@session.errors.full_messages}"
      render :new
    end
  end

  def update
    @session = session.find(params[:id])
    if @session.update(session_params)
      render json: { success: true, message: 'session updated successfully' }
    else
      render jsQon: { success: false, message: @session.errors.full_messages.join(', ') }
    end
  end

  def edit
    @session = session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:workout, :user_id)
  end
end
