require 'open-uri'
class Request < ApplicationRecord
  before_validation :geocode_dropoff_location

  def geocode_dropoff_location
    if self.dropoff_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.dropoff_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.dropoff_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.dropoff_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.dropoff_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  before_validation :geocode_pickup_location

  def geocode_pickup_location
    if self.pickup_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.pickup_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.pickup_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.pickup_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.pickup_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  has_many   :active_gigs,
             :class_name => "Gig",
             :dependent => :destroy

  has_many   :add_on_services,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_many   :providers,
             :through => :active_gigs,
             :source => :provider

  # Validations

  # Scopes

  def to_s
    pickup_datetime
  end

end
