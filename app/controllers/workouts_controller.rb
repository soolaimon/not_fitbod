class WorkoutsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    workouts = user.workouts.order(:id)
    workouts = workouts.where(created_at: DateTime.parse(params[:created_since])..) if params[:created_since]
    render json: {workouts: workouts}
  end
end
