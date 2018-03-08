class User < ApplicationRecord
  before_create :confirmation_token
  after_create :register_with_authy

  has_many :members
  has_many :posts, as: :postable
  has_many :barbershops, through: :members
  accepts_nested_attributes_for :barbershops, reject_if: proc { |attr| attr['barbershop_name'].blank? || attr['bio'].blank? || attr['price'].blank? }
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 60 }
  validates :password_digest, presence: true, length: { minimum: 6 }, on: :create

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def register_with_authy
    authy = Authy::API.register_user(
      email: self.email,
      phone_number: self.phone_number,
      country_code: '1'
    )
    if authy.ok?
      self.update_column(:authy_id, authy.id)
    else
      authy.errors
    end
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
