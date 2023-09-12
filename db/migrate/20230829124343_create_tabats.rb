class CreateTabats < ActiveRecord::Migration[6.1]
  def change
    create_table :tabats do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :burpee, default: 0 # Берпи
      t.float :touching_the_heels, default: 0 # Поочередные касания пяток лежа на полу
      t.float :running_in_place, default: 0 # Бег на месте
      t.float :statics_in_the_squat, default: 0 # Статика в приседе
      t.float :mahi_dumbbells_through_the_sides # Махи гантелями через стороны
      t.float :incline_dumbbell_mahi # Махи гантелей в наклоне
      t.float :sitap, default: 0 # Ситап
      t.float :plank, default: 0 # Планка
      t.float :pushups, default: 0 # Отжимания от пола
      t.float :reverse_plank, default: 0 # Обратная планка
      t.float :skating, default: 0 # Коньковый бег
      t.float :jumping_jack, default: 0 # Джампинг Джек
      t.float :jump_rope, default: 0 # Скакалка
      t.float :plank_touch, default: 0 # Касание плеч стоя в планке
      t.float :trusters # Трастеры
      t.float :kettlebell_swing # Качели с гирей
      t.float :side_climber, default: 0 # Боковой скалолаз
      t.float :barbell_forearm_curl # Сгибание предплечий со штангой
      t.float :push_ups_with_narrow_arms, default: 0 # Отжимания с узкой постановкой рук
      t.float :squats, default: 0 # Приседания
      t.float :plank_reversals, default: 0 # Развороты в планке
      t.integer :monday_reps, default: 30
      t.integer :wednesday_reps, default: 30
      t.integer :friday_reps, default: 30
      t.integer :monday_sets, default: 4
      t.integer :wednesday_sets, default: 4
      t.integer :friday_sets, default: 4
      t.integer :count_update_training, default: 0

      t.timestamps
    end
  end
end
