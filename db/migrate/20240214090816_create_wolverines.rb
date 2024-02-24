class CreateWolverines < ActiveRecord::Migration[6.1]
  def change
    create_table :wolverines do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :barbell_bench_press # Жим штанги
      t.float :dumbbell_bench_press # Жим гантелей лежа
      t.float :push_ups_on_bars # Отжимания на брусьях
      t.float :seated_dumbbell_press #Жим гантелей сидя
      t.float :barbell_pull_to_chin # Тяга штанги к подбородку
      t.float :french_bench_press # Французский жим лежа
      t.float :pull_ups # Подтягивания
      t.float :incline_dumbbell_row # Тяга гантель в наклоне
      t.float :vertical_pull_block # Вертикальная тяга блока
      t.float :bent_over_barbell_pull # Тяга штанги к поясу в наклоне 
      t.float :hyperextension # Гиперэкстензия
      t.float :barbell_forearm_curls # Сгибания предплечий со штангой
      t.float :incline_dumbbell_mahi # Махи гантелей в наклоне
      t.float :seated_leg_extension # Разгибания голени сидя
      t.float :squats # Приседания
      t.float :deadlift # Становая тяга
      t.float :leg_press # Жим ногами
      t.float :lying_leg_flexion # Сгибание голени лежа
      t.float :standing_calf_raises # Подъемы на носки стоя
      t.float :sitap, default: 0 # Ситап
      t.float :hanging_leg_raise, default: 0 # Подъем ног в висе
      t.integer :monday_reps, default: 8
      t.integer :wednesday_reps, default: 8
      t.integer :friday_reps, default: 8
      t.integer :count_update_training, default: 0

      t.timestamps
    end
  end
end
