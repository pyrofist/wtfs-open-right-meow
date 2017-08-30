class Location < ActiveRecord::Base
  has_many :favorites

  validate :has_findable_address
  validates_uniqueness_of :latitude, scope: :longitude

  def has_findable_address
    unless @geocode
      @geocode = Geocode.new(self.address)
    end
    coordinate_hash = @geocode.coordinate_lookup
    if coordinate_hash
      self.latitude = coordinate_hash["lat"]
      self.longitude = coordinate_hash["lng"]
      self.formatted_address = @geocode.formatted_address
    else
      errors.add(:address, "could not be processed")
    end
  end

  def nearby_restaurants
    @place = Place.new(self.latitude, self.longitude)
    @place.results_lookup
  end
end
