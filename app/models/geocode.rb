class Geocode

  def initialize(address)
    @url_string = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{ENV["GOOGLEPLACE"]}"
  end

  def coordinate_lookup
    unless @response_hash
      @response_hash = ApiHelper.get_response_as_hash(@url_string)
    end
    if @response_hash["status"] == "OK"
      @response_hash["results"].first["geometry"]["location"]
    else
      nil
    end
  end

  def formatted_address
    unless @response_hash
      @response_hash = ApiHelper.get_response_as_hash(@url_string)
    end
    if @response_hash["status"] == "OK"
      @response_hash["results"].first["formatted_address"]
    else
      nil
    end
  end

  def address_lookup(latitude, longitude)
    # TODO Much much later, for if we use device location
    # "https://maps.googleapis.com/maps/api/geocode/json?latlng=70.4315,-70.44112"
  end
end
