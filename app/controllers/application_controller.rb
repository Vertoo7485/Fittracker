# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ErrorHandling
  include Authentication
  include CountCalories
  include CountPowerTraining
  include Internationalization
  include CountCrossfitTraining
end