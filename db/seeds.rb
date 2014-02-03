# Create two users
jordan = User.create!(
  email: 'jord@mail.com',
  username: 'jordpo',
  mantra: 'To be great is to is to be misunderstood',
  password: 'valid_password',
  password_confirmation: 'valid_password')

dess = User.create!(
  email: 'dess@mail.com',
  username: 'dess',
  mantra: 'Spring is here',
  password: 'valid_password',
  password_confirmation: 'valid_password')

workout1 = Workout.new(
  name: 'Workout 1',
  difficulty: 'Medium',
  posted: false,
  started: false)

jordan.workouts << workout1

# Exercises
thruster = Exercise.new(name: 'Thruster', detail: 'Strength - 90 pounds', duration: '3 Rounds of 10')
backsquat = Exercise.new(name: 'Back Squat', detail: 'Strength - max', duration: '5 Rounds of 3')
toestobar = Exercise.new(name: 'Toes 2 Bar', detail: 'Endurance', duration: '3 Rounds of 15')
russiantwist = Exercise.new(name: 'Russian Twist', detail: 'Core - 15 pounds min', duration: '3 Rounds of 15')
boxjumps = Exercise.new(name: 'Box Jumps', detail: 'Endurance', duration: '3 Rounds of 20')
lunges = Exercise.new(name: 'Lunges', detail: 'Strength - with 10 pound weight', duration: '5 Rounds of 10')

dess.workouts.create(exercise: thruster, completed: true, pr: true, comment: '90 pounds max')
dess.workouts.create(exercise: russiantwist, completed: true, pr: false, comment: '15 pounds')
dess.workouts.create(exercise: lunges, completed: false, pr: false, comment: 'need to stretch more')

jordan.workouts.create(exercise: backsquat, completed: true, pr: true, comment: '205 pounds max')
jordan.workouts.create(exercise: toestobar, completed: false, pr: false, comment: 'did not finish the last round')
jordan.workouts.create(exercise: boxjumps, completed: true, pr: false, comment: '28 inches high')

