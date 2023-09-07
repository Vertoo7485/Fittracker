class CreateGains < ActiveRecord::Migration[6.1]
  def change
    create_table :gains do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :barbell_bench_press #Жим штанги
      t.float :reverse_push_ups #Обратные отжимания
      t.float :dumbbell_bench_press #Жим гантелей лежа
      t.float :push_ups_on_bars #Отжимания на брусьях
      t.float :stacked_chest_press #Жим на грудь в стеке
      t.float :extension_with_rope_handle #Разгибание с канатной рукояткой 
      t.float :dumbbell_abduction #Отведение гантели 
      t.float :hanging_leg_raise, default: 0 #Подъем ног в висе
      t.float :austrian_pull_ups, default: 0 #Австрийские подтягивания
      t.float :horizontal_pull_block #Горизонтальная тяга блока
      t.float :pull_ups #Подтягивания
      t.float :barbell_forearm_curls #Сгибания предплечий со штангой
      t.float :incline_dumbbell_row #Тяга гантель в наклоне
      t.float :vertical_pull_block #Вертикальная тяга блока
      t.float :hyperextension #Гиперэкстензия
      t.float :hammers #Молотки 
      t.float :book, default: 0 #Книжка 
      t.float :gack_squats #Гакк приседания
      t.float :seated_leg_extension #Разгибания голени сидя
      t.float :leg_press #Жим ногами
      t.float :hamer_shoulder_press #Жим в хамере на плечи
      t.float :dumbbells_through_the_side #Махи гантелей через сторону
      t.float :lying_leg_flexion #Сгибание голени лежа
      t.float :pancake_swing_in_front_of_you #Мах блина перед собой 
      t.float :barbell_pull_to_chin #Тяга штанги к подбородку
      t.float :front_squat #Фронтальный присед
      t.float :hang_grab #Взятие с виса
      t.float :overhead_press #Жим штанги над головой
      t.float :kettlebell_swing #Качели с гирей
      t.float :kettlebell_pull_to_the_chin #Тяга гири к подбородку
      t.float :burpee, default: 0 #Берпи
      t.float :sitap, default: 0 #Ситап
      t.float :russian_twist #Русский твист
      t.float :plank_with_kettlebell_pull #Планка с перетягиванием гири
      t.float :trusters #Трастеры
      t.float :bent_over_barbell_pull #Тяга штанги к поясу в наклоне
      t.float :deadlift #Становая тяга
      t.float :dumbbell_layout #Разводка гантелей лежа на горизонтальной скамье
      t.float :jumping_on_the_pedestal, default: 0 #Запрыгивания на тумбу
      t.float :leg_raises_to_the_bar, default: 0 #Подъемы ног к перекладине
      t.float :riveting, default: 0 #Склепка
      t.float :forearm_curls_and_press_ups_with_a_barbell #Сгибания предплечий и жим вверх со штангой
      t.float :cross_over #Кросс-овер
      t.float :abduction_in_a_butterfly #Отведение в бабочке
      t.float :jumping_lunges, default: 0 #Выпады с выпрыгиванием
      t.float :sumo_squats #Сумо приседания
      t.float :farm_walk #Фермерская прогулка
      t.float :touching_the_heels, default: 0 #Поочередные касания пяток лежа на полу
      t.float :running_in_place, default: 0 #Бег на месте
      t.float :statics_in_the_squat, default: 0 #Статика в приседе
      t.float :incline_dumbbell_mahi #Махи гантелей в наклоне
      t.float :plank, default: 0 #Планка
      t.float :pushups, default: 0 #Отжимания от пола
      t.float :reverse_plank, default: 0 #Обратная планка
      t.float :skating, default: 0 #Коньковый бег
      t.float :jumping_jack, default: 0 #Джампинг Джек
      t.float :jump_rope, default: 0 #Скакалка
      t.float :plank_touch, default: 0 #Касание плеч стоя в планке
      t.float :side_climber, default: 0 #Боковой скалолаз
      t.float :push_ups_with_narrow_arms, default: 0 #Отжимания с узкой постановкой рук
      t.float :squats, default: 0 #Приседания
      t.float :plank_reversals, default: 0 #Развороты в планке
      t.float :rope_strikes, default: 0 #Удары канатами
      t.float :jumping_out, default: 0 #выпрыгивания
      t.float :track, default: 4.5 #Дорожка
      t.float :trapeze_in_smith #Подьем на трапеции в Смите
      t.float :lifting_dumbbells_in_scott #Бицепс в Скотте гантелями
      t.float :biceps_sitting #Бицепс сидя на скамье
      t.float :hull_reversals #Развороты корпуса
      t.float :standing_dumbbell_french_press #Французский жим с гантелей стоя
      t.integer :monday_tabat_reps, default: 30
      t.integer :wednesday_tabat_reps, default: 30
      t.integer :friday_tabat_reps, default: 30
      t.integer :monday_tabat_sets, default: 4
      t.integer :wednesday_tabat_sets, default: 4
      t.integer :friday_tabat_sets, default: 4
      t.integer :monday_reps, default: 8
      t.integer :wednesday_reps, default: 8
      t.integer :friday_reps, default: 8
      t.integer :count_update_training, default: 0

      t.timestamps
    end
  end
end
