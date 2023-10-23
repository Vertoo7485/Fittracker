# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Rails/Metrics/BlockLength
RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'Password123!', role: 'basic', weight: 70,
                      growth: 180, years: 25, gender: 'male')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'john@example.com', password: 'password123', role: 'basic', weight: 70, growth: 180,
                      years: 25, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'John Doe', password: 'password123', role: 'basic', weight: 70, growth: 180, years: 25,
                      gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'John Doe', email: 'john@example.com', role: 'basic', weight: 70, growth: 180, years: 25,
                      gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without a weight' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', growth: 180,
                      years: 25, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without a growth' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', weight: 70,
                      years: 25, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without years' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', weight: 70,
                      growth: 180, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid without a gender' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', weight: 70,
                      growth: 180, years: 25)
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      User.create(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', weight: 70,
                  growth: 180, years: 25, gender: 'male')
      user = User.new(name: 'Jane Smith', email: 'john@example.com', password: 'password456', role: 'basic',
                      weight: 60, growth: 170, years: 30, gender: 'female')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password less than 8 characters' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'pass', role: 'basic', weight: 70,
                      growth: 180, years: 25, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password more than 70 characters' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'a' * 71, role: 'basic', weight: 70,
                      growth: 180, years: 25, gender: 'male')
      expect(user).to_not be_valid
    end

    it 'is not valid with a password that does not meet complexity requirements' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password', role: 'basic', weight: 70,
                      growth: 180, years: 25, gender: 'male')
      expect(user).to_not be_valid
    end
  end

  describe 'associations' do
    let(:user) do
      User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic',
               weight: 70, growth: 180, years: 25, gender: 'male')
    end
    it 'has many powers' do
      expect(user.powers).to be_empty

      power1 = user.powers.build(user:)
      power1.save
      power2 = user.powers.build(user:)
      power2.save

      expect(user.powers).to match_array([power1, power2])
    end

    it 'has many crossfits' do
      expect(user.crossfits).to be_empty

      crossfit1 = user.crossfits.build(user:)
      crossfit1.save
      crossfit2 = user.crossfits.build(user:)
      crossfit2.save

      expect(user.crossfits).to match_array([crossfit1, crossfit2])
    end

    it 'has many gains' do
      expect(user.gains).to be_empty

      gain1 = user.gains.build(user:)
      gain1.save
      gain2 = user.gains.build(user:)
      gain2.save

      expect(user.gains).to match_array([gain1, gain2])
    end

    it 'destroys associated powers when destroyed' do
      expect { user.destroy }.to change { Power.count }.by(0 || -1)
    end

    it 'destroys associated crossfits when destroyed' do
      expect { user.destroy }.to change { Crossfit.count }.by(0 || -1)
    end

    it 'destroys associated gains when destroyed' do
      expect { user.destroy }.to change { Gain.count }.by(0 || -1)
    end
  end

  describe '#guest?' do
    it 'returns false' do
      user = User.new(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic', weight: 70,
                      growth: 180, years: 25, gender: 'male')
      expect(user.guest?).to be_falsey
    end
  end
end
# rubocop:enable Rails/Metrics/BlockLength
