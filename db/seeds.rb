require 'csv'

csv = CSV.open("./db/workout_data.csv")

csv.each do |row|
  user = User.where(email_address: row[0]).first_or_create
  user.workouts.where(date: DateTime.parse(row[1]), duration: row[2].to_i).first_or_create
end
