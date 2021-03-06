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

rvc = Community.new(name: 'RVC', description: 'Upper Valley locals doing crossfit')

workout1 = Workout.new(
  name: 'Workout 1',
  difficulty: 'Medium',
  started: false,
  user: jordan,
  community: rvc)

workout2 = Workout.new(
  name: 'Workout 2',
  difficulty: 'High',
  started: true,
  user: dess,
  community: rvc)

# Exercises
thruster = Exercise.new(name: 'Thruster', detail: 'Strength - 90 pounds', duration: '3 Rounds of 10')
backsquat = Exercise.new(name: 'Back Squat', detail: 'Strength - max', duration: '5 Rounds of 3')
toestobar = Exercise.new(name: 'Toes 2 Bar', detail: 'Endurance', duration: '3 Rounds of 15')
russiantwist = Exercise.new(name: 'Russian Twist', detail: 'Core - 15 pounds min', duration: '3 Rounds of 15')
boxjumps = Exercise.new(name: 'Box Jumps', detail: 'Endurance', duration: '3 Rounds of 20')
lunges = Exercise.new(name: 'Lunges', detail: 'Strength - with 10 pound weight', duration: '5 Rounds of 10')

workout1.exercises << backsquat << toestobar << lunges
workout2.exercises << thruster << russiantwist << boxjumps << toestobar


dess.workout_sessions.create!(workout: workout1, pr: false, comment: 'Not bad but did better last time',
  accomplished: true)

dess.exercise_sessions.create!(exercise: backsquat,
  pr: true,
  workout_id: 1,
  comment: 'did it',
  mod: nil,
  accomplished: true,
  status: 'complete')
dess.exercise_sessions.create!(exercise: toestobar,
  pr: false,
  workout_id: 1,
  comment: 'struggled',
  mod: 'did v situps instead',
  accomplished: true,
  status: 'complete')
dess.exercise_sessions.create!(exercise: lunges,
  pr: false,
  workout_id: 1,
  comment: 'getting pretty good',
  mod: 'added ten pound weight',
  accomplished: true,
  status: 'complete')


jordan.workout_sessions.create!(workout: workout2, pr: true, comment: 'crushed it',
  accomplished: true)

jordan.exercise_sessions.create!(exercise: thruster,
  pr: false,
  workout_id: 2,
  comment: 'very hard',
  mod: 'used a lighter weight',
  accomplished: true,
  status: 'complete')
jordan.exercise_sessions.create!(exercise: russiantwist,
  pr: true,
  workout_id: 2,
  comment: 'abs are killing me!',
  mod: nil,
  accomplished: true,
  status: 'complete')
jordan.exercise_sessions.create!(exercise: boxjumps,
  pr: false,
  workout_id: 2,
  comment: 'higher than last time',
  mod: nil,
  accomplished: true,
  status: 'complete')
jordan.exercise_sessions.create!(exercise: toestobar,
  pr: false,
  workout_id: 2,
  comment: 'struggled with the last set',
  mod: 'did v-ups the last set',
  accomplished: true,
  status: 'complete')
