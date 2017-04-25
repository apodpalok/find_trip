class User < ApplicationRecord
  has_many :cars
  has_many :reviews, dependent: :destroy
  has_many :trip_memberships
  has_many :trips, through: :trip_memberships
  has_many :authored_reviews, class_name: 'Review', foreign_key: 'author_id'
  has_and_belongs_to_many :trips_as_driver, class_name: 'Trip', join_table: 'drivers_trips',
                                            foreign_key: 'driver_id'
  has_and_belongs_to_many :trips_as_passenger, join_table: 'passengers_trips',
                                               foreign_key: 'passenger_id'
  has_many :identities, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, if: :email_required?
  validates :email, uniqueness: true, allow_blank: true, if: :email_changed?
  validates :email, format: { with: Devise.email_regexp }, allow_blank: true, if: :email_changed?
  validates :password, presence: true, confirmation: true, if: :password_required?
  validates :password, length: { within: Devise.password_length }, allow_blank: true

  mount_uploader :avatar, AvatarUploader
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  acts_as_messageable

  def mailboxer_name
    self.full_name
  end

  def mailboxer_email(object)
    self.email
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def average_review
    self.reviews.average(:rating).to_f.round(1)
  end

  def percent_review(rating)
    self.reviews.where(rating: rating).count.to_f / self.reviews.count.to_f * 100
  end

  def facebook
    identities.where( provider: "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.birth_date.year - ((now.month > self.birth_date.month || 
                                       (now.month == self.birth_date.month && 
                                        now.day >= self.birth_date.day)) ? 0 : 1)
  end
  def password_required?
    return false if email.blank?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  def email_required?
    true
  end
end
