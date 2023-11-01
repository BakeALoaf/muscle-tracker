class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.created_at = Time.current
    @session.user = current_user
    if @session.save
      redirect_to trackers_path
    else
      puts "Session errors: #{@session.errors.full_messages}"
      render :new
    end
  end

  def update
    @session = session.find(params[:id])
    if @session.update(session_params)
      render json: { success: true, message: 'session updated successfully' }
    else
      render jsQon: { success: false, message: @session.errors.full_messages.join(', ') }
    end
  end

  def edit
    @session = session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:workout, :user_id)
  end

  WORKOUT_OPTIONS = [
    ['Bench Press', 'bench_press'],
    ['Straight Bar Curl', 'straight_bar_curl'],
    ['Hammer Curls', 'hammer_curls'],
    ['Squats', 'squats'],
    ['Deadlifts', 'deadlifts'],
    ['Leg Press', 'leg_press'],
    ['Pull-Ups', 'pull_ups'],
    ['Push-Ups', 'push_ups'],
    ['Lat Pulldown', 'lat_pulldown'],
    ['Shoulder Press', 'shoulder_press'],
    ['Chest Fly', 'chest_fly'],
    ['Planks', 'planks'],
    ['Leg Raises', 'leg_raises'],
    ['Russian Twists', 'russian_twists'],
    ['Burpees', 'burpees'],
    ['Box Jumps', 'box_jumps'],
    ['Sprints', 'sprints'],
    ['Bicycle Crunches', 'bicycle_crunches'],
    ['Lunges', 'lunges'],
    ['Tricep Dips', 'tricep_dips'],
    ['Hanging Leg Raises', 'hanging_leg_raises'],
    ['Kettlebell Swings', 'kettlebell_swings'],
    ['Mountain Climbers', 'mountain_climbers'],
    ['Incline Bench Press', 'incline_bench_press'],
    ['Cable Rows', 'cable_rows'],
    ['Lateral Raises', 'lateral_raises'],
    ['Romanian Deadlifts', 'romanian_deadlifts'],
    ['Seated Leg Curl', 'seated_leg_curl'],
    ['Battle Ropes', 'battle_ropes'],
    ['Bicep Curls', 'bicep_curls'],
    ['Hyperextensions', 'hyperextensions'],
    ['Calf Raises', 'calf_raises'],
    ['Barbell Rows', 'barbell_rows'],
    ['Side Planks', 'side_planks'],
    ['Plyometric Exercises', 'plyometric_exercises'],
    ['Sled Push/Pull', 'sled_push_pull'],
    ['Hindu Push-Ups', 'hindu_push_ups'],
    ['Rowing Machine', 'rowing_machine'],
    ['Boxing Training', 'boxing_training'],
    ['Agility Ladder Drills', 'agility_ladder_drills'],
    ['Sandbag Training', 'sandbag_training'],
    ['Climbing Wall', 'climbing_wall'],
    ['BOSU Ball Workouts', 'bosu_ball_workouts'],
    ['Tire Flips', 'tire_flips'],
    ['Parkour Training', 'parkour_training'],
    ['Crossfit WODs', 'crossfit_wods'],
    ['Yoga Asanas', 'yoga_asanas'],
    ['Pilates Reformer', 'pilates_reformer'],
    ['Aerial Silks', 'aerial_silks'],
    ['Pole Dancing Fitness', 'pole_dancing_fitness'],
    ['Yin Yoga', 'yin_yoga'],
    ['Aqua Zumba', 'aqua_zumba'],
    ['Aqua Cycling', 'aqua_cycling'],
    ['Handstand Push-Ups', 'handstand_push_ups'],
    ['Ziplining Adventure', 'ziplining_adventure'],
    ['Surfing Lessons', 'surfing_lessons'],
    ['Hiking Trails', 'hiking_trails'],
    ['Indoor Rock Climbing', 'indoor_rock_climbing'],
    ['Obstacle Course Racing', 'obstacle_course_racing'],
    ['Bodyweight Exercises', 'bodyweight_exercises'],
    ['Dumbbell Rows', 'dumbbell_rows'],
    ['Leg Extensions', 'leg_extensions'],
    ['Jumping Jacks', 'jumping_jacks'],
    ['Swiss Ball Exercises', 'swiss_ball_exercises'],
    ['Sled Drags', 'sled_drags'],
    ['Barbell Shrugs', 'barbell_shrugs'],
    ['Sprint Intervals', 'sprint_intervals'],
    ['Battle Ropes Waves', 'battle_ropes_waves'],
    ['Pilates Mat Work', 'pilates_mat_work'],
    ['TRX Suspension Workouts', 'trx_suspension_workouts'],
    ['Boxing Mitt Work', 'boxing_mitt_work'],
    ['Zumba Toning', 'zumba_toning'],
    ['Aerial Hoop (Lyra)', 'aerial_hoop_lyra'],
    ['Tai Chi Chuan', 'tai_chi_chuan'],
    ['Foam Rolling Techniques', 'foam_rolling_techniques'],
    ['Slacklining', 'slacklining'],
    ['Water Aerobics', 'water_aerobics'],
    ['High-Intensity Spin Classes', 'high_intensity_spin_classes'],
    ['Synchronized Swimming', 'synchronized_swimming'],
    ['Body Combat Classes', 'body_combat_classes'],
    ['Hula Hooping', 'hula_hooping'],
    ['Kick Scooter Workouts', 'kick_scooter_workouts'],
    ['Synchronized Rowing', 'synchronized_rowing'],
    ['Kendo (Japanese Swordsmanship)', 'kendo'],
    ['Fencing', 'fencing'],
    ['Paddleboarding', 'paddleboarding'],
    ['Kiteboarding', 'kiteboarding'],
    ['Trapeze Flying', 'trapeze_flying'],
    ['Plyometric Box Jumps', 'plyometric_box_jumps'],
    ['Piloxing (Pilates + Boxing)', 'piloxing'],
    ['Aqua Pole Dance', 'aqua_pole_dance'],
    ['Aquatic Therapy', 'aquatic_therapy'],
    ['Wall Ball Exercises', 'wall_ball_exercises'],
    ['Yoga Wheel Poses', 'yoga_wheel_poses'],
    ['Indoor Skydiving', 'indoor_skydiving'],
    ['Bungee Fitness', 'bungee_fitness'],
    ['Synchronized Yoga', 'synchronized_yoga'],
    ['Wheelchair Fitness', 'wheelchair_fitness'],
    ['Adaptive Rowing', 'adaptive_rowing'],
    ['Virtual Reality Workouts', 'virtual_reality_workouts'],
    ['Prancercise', 'prancercise'],
    ['Nordic Walking', 'nordic_walking'],
    ['Shbam Dance Fitness', 'shbam_dance_fitness'],
    ['Cup Stacking', 'cup_stacking'],
    ['Bollywood Dance Workouts', 'bollywood_dance_workouts'],
    ['Medicine Ball Slams', 'medicine_ball_slams'],
    ['Slackline Yoga', 'slackline_yoga'],
    ['Unicycling', 'unicycling'],
    ['Breakdancing', 'breakdancing'],
    ['Belly Dancing', 'belly_dancing'],
    ['Powerlifting', 'powerlifting'],
    ['Parkour Freerunning', 'parkour_freerunning'],
    ['Aerial Straps', 'aerial_straps'],
    ['Ninja Warrior Obstacle Training', 'ninja_warrior_training'],
    ['Parkour Gyms', 'parkour_gyms'],
    ['Urban Calisthenics', 'urban_calisthenics'],
    ['Juggling for Fitness', 'juggling_for_fitness'],
    ['Rhythmic Gymnastics', 'rhythmic_gymnastics'],
    ['Bokwa Fitness', 'bokwa_fitness'],
    ['Fitness Trampolining', 'fitness_trampolining'],
    ['Street Workout (Calisthenics)', 'street_workout'],
    ['Kangoo Jumps Workouts', 'kangoo_jumps'],
    ['Primal Movement Workouts', 'primal_movement'],
  ]
end
