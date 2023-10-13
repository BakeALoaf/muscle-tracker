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

  def tracker_params
    params.require(:tracker).permit(:workout, :weight, :reps, :sets)
  end
end
