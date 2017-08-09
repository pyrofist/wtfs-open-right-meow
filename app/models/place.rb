class Place
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
    @url_string = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&opennow=true&type=restaurant&key=#{ENV["GOOGLEPLACE"]}"
  end

  def results_lookup
    @response_hash = ApiHelper.get_response_as_hash(@url_string)

    if @response_hash["status"] == "OK"
      results = @response_hash["results"].map do |result|
        {name: result["name"], address: result["vicinity"]}
      end
      results
    else
      []
    end
  end
end
