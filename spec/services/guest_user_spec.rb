require 'rails_helper'

RSpec.describe GuestUser do
  let(:guest_user) { GuestUser.new }

  describe '#guest?' do
    it 'returns true' do
      expect(guest_user.guest?).to be true
    end
  end

  describe 'role methods' do
    it 'returns false for any method ending with "_role?"' do
      expect(guest_user.admin_role?).to be false
      expect(guest_user.manager_role?).to be false
      expect(guest_user.user_role?).to be false
    end
  end
end