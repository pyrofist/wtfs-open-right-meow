class Cat

  def self.get_and_display(image_options)
    gif = image_options.fetch(:gif, false)
    category = image_options.fetch(:category, nil)
    size = image_options.fetch(:size, "full")
    css_class = image_options.fetch(:css_class, "")
    xml_hash = self.image_html(gif, category, size)
    self.display(xml_hash, css_class)
  end
private

  def self.display(xml_hash, css_class = "")
    image = xml_hash["data"]["images"]["image"]
    source_url = image["source_url"]
    url = image["url"]
    html = "<a target='_blank' href='#{source_url}'><img src='#{url}'"
    if css_class
      html << " class= #{css_class} "
    end
    html + "></a>"
  end

  def self.image_html(gif = false, category = nil, size = "full")
    if gif
      type="gif"
    else
      type="jpg,png"
    end
    url_string = "http://thecatapi.com/api/images/get?api_key=#{ENV["CATAPI"]}&format=xml&type=#{type}&size=#{size}"
    if category
      url_string << "&category=#{category}"
    end
    APIHelper.get_response_as_hash(url_string, "XML")
  end
end
