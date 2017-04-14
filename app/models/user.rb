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

  mount_uploader :avatar, AvatarUploader
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def facebook
    identities.where( :provider => "facebook" ).first
  end

  def facebook_client
    @facebook_client ||= Facebook.client( access_token: facebook.accesstoken )
  end
end
