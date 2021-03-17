class WorkoutsController < ApplicationController
  before_action(:get_user)

  def index
    workouts = @user.workouts.order(:id)
    workouts = workouts.where(created_at: DateTime.parse(params[:created_since])..) if params[:created_since]
    render json: {user: {email_address: @user.email_address}, workouts: workouts}
  end

  def create
    render json: {user: {email_address: @user.email_address}, workout: @user.workouts.create(workout_params)}
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  def workout_params
    params.require(:workout).permit(:date, :duration)
  end
end
