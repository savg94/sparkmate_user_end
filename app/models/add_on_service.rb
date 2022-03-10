require "open-uri"
class AddOnService < ApplicationRecord
  before_validation :geocode_maintenance_location

  def geocode_maintenance_location
    if maintenance_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(maintenance_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.maintenance_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.maintenance_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.maintenance_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  # Direct associations

  belongs_to :request

  # Indirect associations

  # Validations

  validates :request_id, presence: true

  # Scopes

  def to_s
    created_at
  end
end
