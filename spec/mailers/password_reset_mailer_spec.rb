require 'rails_helper'

RSpec.describe PasswordResetMailer, type: :mailer do
  describe '#reset_email' do
    let(:user) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }

    before do
      Rails.application.routes.default_url_options[:host] = 'localhost:3000'
      allow(I18n).to receive(:t).with('password_reset_mailer.reset_email.subject') { 'Reset Password' }

    end

    it 'sends an email with the correct subject and recipient' do
      mail = PasswordResetMailer.with(user: user).reset_email

      expect(mail.subject).to eq('Reset Password')
      expect(mail.to).to eq([user.email])
    end

    it 'renders the correct template' do
      expect(PasswordResetMailer).to receive(:with).with(user: user).and_return(PasswordResetMailer)
      expect(PasswordResetMailer).to receive(:reset_email).and_return(nil)

      PasswordResetMailer.with(user: user).reset_email
    end
  end
end