# frozen_string_literal: true

module CountCalories
  extend ActiveSupport::Concern

  # rubocop:disable Metrics/BlockLength
  included do
    private

    def men_weight_loss_diet
      @men_basal_metabolism = (9.99 * current_user.weight) + (6.25 * current_user.growth) - (4.92 * current_user.years) + 5
      @men_daily_calorie_intake = ((@men_basal_metabolism * 0.1) + @men_basal_metabolism) * 1.375
      @men_weight_loss_diet = (@men_daily_calorie_intake - (@men_daily_calorie_intake * 0.2))
      @men_weight_loss_diet.round(2)
    end

    def men_weight_gain_diet
      @men_basal_metabolism = (9.99 * current_user.weight) + (6.25 * current_user.growth) - (4.92 * current_user.years) + 5
      @men_daily_calorie_intake = ((@men_basal_metabolism * 0.1) + @men_basal_metabolism) * 1.375
      @men_weight_gain_diet = (@men_daily_calorie_intake * 0.1) +  @men_daily_calorie_intake.to_i
      @men_weight_gain_diet.round(2)
    end

    def fem_weight_loss_diet
      @fem_basal_metabolism = (9.99 * current_user.weight) + (6.25 * current_user.growth) - (4.92 * current_user.years) - 161
      @fem_daily_calorie_intake = ((@fem_basal_metabolism.to_i * 0.1) + @fem_basal_metabolism) * 1.375
      @fem_weight_loss_diet = (@fem_daily_calorie_intake.to_i - (@fem_daily_calorie_intake.to_i * 0.2))
      @fem_weight_loss_diet.round(2)
    end

    def fem_weight_gain_diet
      @fem_basal_metabolism = (9.99 * current_user.weight) + (6.25 * current_user.growth) - (4.92 * current_user.years) - 161
      @fem_daily_calorie_intake = ((@fem_basal_metabolism.to_i * 0.1) + @fem_basal_metabolism) * 1.375
      @fem_weight_gain_diet = (@fem_daily_calorie_intake.to_i + (@fem_daily_calorie_intake * 0.1))
      @fem_weight_gain_diet.round(2)
    end

    helper_method :men_weight_loss_diet, :men_weight_gain_diet, :fem_weight_loss_diet, :fem_weight_gain_diet
  end
  # rubocop:enable Metrics/BlockLength
end
