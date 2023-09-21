# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@fittracker.com'
  layout 'mailer'
end
