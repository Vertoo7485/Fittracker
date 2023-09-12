class CreateCrossfits < ActiveRecord::Migration[6.1]
  def change
    create_table :crossfits do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :front_squat # Фронтальный присед
      t.float :hang_grab # Взятие с виса
      t.float :overhead_press # Жим штанги над головой
      t.float :kettlebell_swing # Качели с гирей
      t.float :kettlebell_pull_to_the_chin # Тяга гири к подбородку
      t.float :burpee, default: 0 # Берпи
      t.float :sitap, default: 0 # Ситап
      t.float :russian_twist # Русский твист
      t.float :plank_with_kettlebell_pull # Планка с перетягиванием гири
      t.float :trusters # Трастеры
      t.float :bent_over_barbell_pull # Тяга штанги к поясу в наклоне
      t.float :deadlift # Становая тяга
      t.float :mahi_dumbbells_through_the_sides # Махи гантелями через стороны
      t.float :dumbbell_layout # Разводка гантелей лежа на горизонтальной скамье
      t.float :barbell_pull_to_chin # Тяга штанги к подбородку
      t.float :jumping_on_the_pedestal, default: 0 # Запрыгивания на тумбу
      t.float :leg_raises_to_the_bar, default: 0 # Подъемы ног к перекладине
      t.float :riveting, default: 0 # Склепка
      t.float :forearm_curls_and_press_ups_with_a_barbell # Сгибания предплечий и жим вверх со штангой
      t.float :cross_over # Кросс-овер
      t.float :abduction_in_a_butterfly # Отведение в бабочке
      t.float :lying_leg_flexion # Сгибания голени лежа
      t.float :seated_leg_extension # Разгибания голени сидя
      t.float :jumping_lunges, default: 0 # Выпады с выпрыгиванием
      t.float :sumo_squats # Сумо приседания
      t.float :farm_walk # Фермерская прогулка
      t.integer :count_update_training, default: 0

      t.timestamps
    end
  end
end
