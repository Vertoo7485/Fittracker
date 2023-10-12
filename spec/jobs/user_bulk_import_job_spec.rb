require 'rails_helper'

RSpec.describe UserBulkImportJob, type: :job do
  describe '#perform' do
    let(:archive_key) { 'example_archive_key' }
    let(:initiator) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }

    context 'when UserBulkImportService is successful' do
      before do
        allow(UserBulkImportService).to receive(:call).with(archive_key)
      end

      it 'sends a bulk import done email to the initiator' do
        expect {
          UserBulkImportJob.perform_now(archive_key, initiator)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)

        mail = ActionMailer::Base.deliveries.last
        expect(mail.to).to eq([initiator.email])
        expect(mail.subject).to eq(I18n.t('admin.user_mailer.bulk_import_done.subject'))
      end
    end

    context 'when UserBulkImportService raises an error' do
      let(:error) { StandardError.new('Example error') }
    
      before do
        allow(UserBulkImportService).to receive(:call).with(archive_key).and_raise(error)
      end
    
      it 'sends a bulk import fail email to the initiator with the error message' do
        expect {
          UserBulkImportJob.perform_now(archive_key, initiator)
        }.to change { ActionMailer::Base.deliveries.count }.by(1)
    
        mail = ActionMailer::Base.deliveries.last
        expect(mail.to).to eq([initiator.email])
        expect(mail.subject).to eq(I18n.t('admin.user_mailer.bulk_import_fail.subject'))
        expect(mail.body.parts[0].decoded).to include(error.message)
      end
    end
  end
end