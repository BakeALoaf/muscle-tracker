class TrackersController < ApplicationController
  def index
    @track = Tracker.all
  end

  def show
  end

  def new
    @tracker = Tracker.new
  end

  def create
    @tracker = Tracker.new(tracker_params)
    if @tracker.save!
      redirect_to trackers_path
    else
      render :new
    end
  end

  def update
    @tracker = Tracker.find(params[:id])
    if @tracker.update(tracker_params)
      render json: { success: true, message: 'Tracker updated successfully' }
    else
      render json: { success: false, message: @tracker.errors.full_messages.join(', ') }
    end
  end

  def edit
    @tracker = Tracker.find(params[:id])
  end

  def tracker_params
    params.require(:tracker).permit(:workout, :weight, :reps, :sets)
  end
end
