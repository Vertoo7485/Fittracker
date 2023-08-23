# frozen_string_literal: true

class CreatePowers < ActiveRecord::Migration[6.1]
  def change
    create_table :powers do |t|
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
      t.integer :monday_reps, default: 8
      t.integer :wednesday_reps, default: 8
      t.integer :friday_reps, default: 8
      t.integer :count_update_training, default: 0

      t.timestamps
    end
  end
end
