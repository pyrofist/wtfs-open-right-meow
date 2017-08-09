require 'net/http'
require 'json'
require 'active_support'

module ApiHelper
  def self.get_response_as_hash(url, format = "JSON")
    response = get_response(url)
    if format == "JSON"
      JSON.parse(response)
    elsif format == "XML"
      Hash.from_xml(response)["response"]
    else
      {response: response}
    end
  end

  def self.get_response(url)
    uri = URI.parse(URI.encode(url))
    p "(" * 100
    p "Request to #{url}"
    p ")" * 100
    Net::HTTP.get(uri)
  end

end
