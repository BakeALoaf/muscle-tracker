class TrackersController < ApplicationController
  def index
    @user = current_user
    @track = Tracker.all
    @session = Session.where(user: @user)
  end

  def show
  end

  def new
    @session = Session.find_by(id: params[:session_id])
    @tracker = @session.trackers.create(weight: 0, reps: 0)
    redirect_to trackers_path
  end

  # def create
  #   @session = Session.find_by(id: params[:tracker][:session_id])
  #   @tracker = @session.trackers.build(tracker_params.merge(reps: 0, weight: 0))

  #   if @tracker.save
  #     redirect_to trackers_path
  #   else
  #     flash[:error] = 'Tracker creation failed.'
  #     render :new
  #   end
  # end

  def update
    @tracker = Tracker.find(params[:id])
    if @tracker.update(tracker_params)
      render json: { success: true, message: 'Tracker updated successfully' }
    else
      render jsQon: { success: false, message: @tracker.errors.full_messages.join(', ') }
    end
  end

  def edit
    @tracker = Tracker.find(params[:id])
  end

  def tracker_params
    params.require(:tracker).permit(:workout, :weight, :reps, :sets, :session_id, :user_id)
  end
end
