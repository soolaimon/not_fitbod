class WorkoutsController < ApplicationController
  before_action(:get_user)

  def index
    workouts = @user.workouts.order(:id)
    workouts = workouts.where(created_at: DateTime.parse(params[:created_since])..) if params[:created_since]
    render json: {workouts: workouts}
  end

  def create
    render json: {workout: @user.workouts.create(workout_params)}
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  def workout_params
    params.require(:workout).permit(:date, :duration)
  end
end
