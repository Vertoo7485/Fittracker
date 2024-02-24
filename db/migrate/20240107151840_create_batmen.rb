class CreateBatmen < ActiveRecord::Migration[6.1]
  # rubocop:disable Metrics/BlockLength
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def change
    create_table :batmen do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :barbell_bench_press # Жим штанги
      t.float :incline_dumbbell_press #Жим гантелей лежа на наклонной скамье
      t.float :push_ups_on_bars # Отжимания на брусьях
      t.float :overhead_press # Жим штанги над головой
      t.float :barbell_pull_to_chin # Тяга штанги к подбородку
      t.float :dumbbells_through_the_side # Махи гантелей через сторону
      t.float :french_bench_press # Французский жим лежа
      t.float :deadlift # Становая тяга
      t.float :pull_ups # Подтягивания
      t.float :bent_over_barbell_pull # Тяга штанги к поясу в наклоне 
      t.float :vertical_pull_block # Вертикальная тяга блока
      t.float :horizontal_pull_block # Горизонтальная тяга блока
      t.float :barbell_forearm_curls # Сгибания предплечий со штангой
      t.float :lifting_dumbbells_in_scott # Бицепс в Скотте гантелями
      t.float :incline_dumbbell_mahi # Махи гантелей в наклоне
      t.float :seated_leg_extension # Разгибания голени сидя
      t.float :squats # Приседания
      t.float :leg_press # Жим ногами
      t.float :lunges # Выпады
      t.float :lying_leg_flexion # Сгибание голени лежа
      t.float :standing_calf_raises # Подъемы на носки стоя
      t.float :sitap, default: 0 # Ситап
      t.float :book, default: 0 # Книжка
      t.integer :monday_reps, default: 8
      t.integer :wednesday_reps, default: 8
      t.integer :friday_reps, default: 8
      t.integer :count_update_training, default: 0
      
      t.timestamps
    end
  end
  # rubocop:enable Metrics/BlockLength
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
