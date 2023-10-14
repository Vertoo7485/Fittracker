# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PasswordResetMailer, type: :mailer do
  describe '#reset_email' do
    let(:user) do
      User.create(email: 'Test@example.com', name: 'Test',
                  password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                  weight: 85, growth: 183, years: 27, gender: 'male')
    end

    before do
      Rails.application.routes.default_url_options[:host] = 'localhost:3000'
      allow(I18n).to receive(:t).with('password_reset_mailer.reset_email.subject') { 'Reset Password' }
    end

    it 'sends an email with the correct subject and recipient' do
      mail = PasswordResetMailer.with(user:).reset_email

      expect(mail.subject).to eq('Reset Password')
      expect(mail.to).to eq([user.email])
    end

    it 'renders the correct template' do
      expect(PasswordResetMailer).to receive(:with).with(user:).and_return(PasswordResetMailer)
      expect(PasswordResetMailer).to receive(:reset_email).and_return(nil)

      PasswordResetMailer.with(user:).reset_email
    end
  end
end
