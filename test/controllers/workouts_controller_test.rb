require "test_helper"

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
   test "#index allows filtering by 'created_since'" do
     user = create(:user)
     three_hours_ago = create(:workout, created_at: Time.now - 3.hours, user: user)
     two_hours_ago = create(:workout, created_at: Time.now - 2.hours, user: user)
     one_hour_ago = create(:workout, created_at: Time.now - 1.hours, user: user)
     one_minute_ago = create(:workout, created_at: Time.now - 1.minute, user: user)
     now = create(:workout, user: user)

     get user_workouts_path(user, params: {created_since: (Time.now- 1.minute).to_s})
     assert_response :success

     workouts = JSON.parse(response.body)["workouts"]

     assert workouts.length == 2
     workout_ids = workouts.map { |w| w["id"] }
     assert workout_ids.include?(one_minute_ago.id)
     assert workout_ids.include?(now.id)


     # Without filter
     get user_workouts_path(user)
     assert_response :success

     workouts = JSON.parse(response.body)["workouts"]
     assert workouts.length == 5
   end

end
