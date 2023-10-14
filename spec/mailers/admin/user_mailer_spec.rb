# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::UserMailer, type: :mailer do
  let(:user) do
    User.create(email: 'Test@example.com', name: 'Test',
                password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
                weight: 85, growth: 183, years: 27, gender: 'male')
  end

  before do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  end

  describe '#bulk_import_done' do
    before do
      allow(I18n).to receive(:t).with('admin.user_mailer.bulk_import_done.subject') { 'Bulk Import Done' }
    end

    it 'sends an email with the correct subject and recipient' do
      mail = Admin::UserMailer.with(user:).bulk_import_done

      expect(mail.subject).to eq('Bulk Import Done')
      expect(mail.to).to eq([user.email])
    end
  end

  describe '#bulk_import_fail' do
    let(:error) { 'Something went wrong.' }

    before do
      allow(I18n).to receive(:t).with('admin.user_mailer.bulk_import_fail.subject') { 'Bulk Import Fail' }
    end

    it 'sends an email with the correct subject, recipient, and error message' do
      mail = Admin::UserMailer.with(user:, error:).bulk_import_fail

      expect(mail.subject).to eq('Bulk Import Fail')
      expect(mail.to).to eq([user.email])
      expect(mail.body.encoded).to include(error)
    end
  end

  describe '#bulk_export_done' do
    let(:stream) { StringIO.new('Mock file content') }

    before do
      allow(I18n).to receive(:t).with('admin.user_mailer.bulk_export_done.subject') { 'Bulk Export Done' }
    end

    it 'sends an email with the correct subject, recipient, and attachment' do
      mail = Admin::UserMailer.with(user:, stream:).bulk_export_done

      expect(mail.subject).to eq('Bulk Export Done')
      expect(mail.to).to eq([user.email])
      expect(mail.attachments.count).to eq(1)
      expect(mail.attachments.first.filename).to eq('result.zip')
      expect(mail.attachments.first.body.encoded).to eq('Mock file content')
    end
  end
end
