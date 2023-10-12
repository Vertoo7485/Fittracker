require 'rails_helper'

RSpec.describe UserBulkExportJob, type: :job do
  describe '#perform' do
    let(:initiator) { User.create(email: 'Test@example.com', name: 'Test',
      password: 'Passw0rd!', password_confirmation: 'Passw0rd!', old_password: 'Passw0rd!',
      weight: 85, growth: 183, years: 27, gender: 'male') }

    it 'sends a bulk export email to the initiator' do
      expect {
        UserBulkExportJob.perform_now(initiator)
      }.to change { ActionMailer::Base.deliveries.count }.by(1)

      mail = ActionMailer::Base.deliveries.last
      expect(mail.to).to eq([initiator.email])
    end
  end
end