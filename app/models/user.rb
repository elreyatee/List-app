class User < ActiveRecord::Base
  include Sluggable

  has_many :lists
  has_many :items

  has_secure_password validations: false #supresses default validations

  validates :username, presence: true, uniqueness: true
  validates :email,  presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  sluggable_column :username
  before_create :generate_token

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(auth_token: self[:auth_token])
  end

  # def request_venue(lat_long, venue)

  #   client_id = '3KPTE0RHLBDN4Q222KPSZ2PFZIH4FFOGOIV13ZALVBT5Y5JZ'
  #   client_secret = 'BRXYDEIVYFEXQZHB5U44PH443YIEP2R1SBUQUDTYMH4DDMTU'

  #   #Set up client to talk to Foursquare API
  #   client = Foursquare2::Client.new(client_id: client_id , client_secret: client_secret, api_version: '20140405')

  #   client.search_venues(ll: lat_long, query: venue)
  # end

end
