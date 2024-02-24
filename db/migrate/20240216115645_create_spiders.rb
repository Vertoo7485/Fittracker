class CreateSpiders < ActiveRecord::Migration[6.1]
  def change
    create_table :spiders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :barbell_bench_press # Жим штанги
      t.float :incline_press #жим на наклонной скамье
      t.float :push_ups_on_bars # Отжимания на брусьях
      t.float :close_grip_bench_press #Жим лежа узким хватом
      t.float :seated_dumbbell_press #Жим гантелей сидя
      t.float :barbell_pull_to_chin # Тяга штанги к подбородку
      t.float :deadlift # Становая тяга
      t.float :pull_ups # Подтягивания
      t.float :incline_dumbbell_row # Тяга гантель в наклоне
      t.float :horizontal_pull_block # Горизонтальная тяга блока
      t.float :barbell_forearm_curls # Сгибания предплечий со штангой
      t.float :squats # Приседания
      t.float :leg_press # Жим ногами
      t.float :romanian_deadlift #Румынская тяга
      t.float :lunges # Выпады
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
end
