# frozen_string_literal: true

class User < ApplicationRecord
  include Recoverable
  include Rememberable

  enum role: { basic: 0, moderator: 1, admin: 2 }, _suffix: :role

  attr_accessor :old_password, :admin_edit, :day

  has_one_attached :avatar

  has_many :photos

  has_many :powers, dependent: :destroy
  has_many :crossfits, dependent: :destroy
  has_many :gains, dependent: :destroy

  has_secure_password validations: false

  validate :password_presence
  validate :correct_old_password, on: :update, if: -> { password.present? && !admin_edit }
  validates :password, confirmation: true, allow_blank: true,
                       length: { minimum: 8, maximum: 70 }

  validates :email, presence: true, uniqueness: true, 'valid_email_2/email': true
  validate :password_complexity
  validates :role, presence: true

  validates :weight, presence: true
  validates :growth, presence: true
  validates :years, presence: true
  validates :gender, presence: true

  def guest?
    false
  end

  private

  def digest(string)
    cost = if ActiveModel::SecurePassword
              .min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost:)
  end

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    msg = 'complexity requirement not met. Length should be 8-70 characters and ' \
          'include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    errors.add :password, msg
  end

  def password_presence
    errors.add(:password, :blank) if password_digest.blank?
  end
end
