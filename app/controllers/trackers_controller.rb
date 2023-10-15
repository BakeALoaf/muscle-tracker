class TrackersController < ApplicationController
  def index
    @track = Tracker.all
    @session = Session.all
  end

  def show
  end

  def new
    @session = Session.find_by(id: params[:session_id])
    @tracker = @session.trackers.build
  end

  def create
    @session = Session.find_by(id: params[:tracker][:session_id])
    @tracker = Tracker.new(tracker_params)
    #matching_trackers = @track.select { |t| t.session_id == s.id }
    @tracker.session = @session
    if @tracker.save
      redirect_to trackers_path
    else
      flash[:error] = 'Tracker creation failed.'
      render :new
    end
  end

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
    params.require(:tracker).permit(:workout, :weight, :reps, :sets, :session_id)
  end
end
