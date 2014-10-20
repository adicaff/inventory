module ApplicationHelper

  # Extract from a text the first contained url's
  #
  # @param [String] text The text to search for the url.
  # @param [String] url_type The type of url to search for.
  #
  # @return [String] The url found at the text.
  def extract_url(text, url_type)
    URI.extract(text, url_type)[0]
  end

  # Check if url is not nil
  #
  # @param [String] url The url to check.
  def url_exists?(url)
    url!=nil
  end

end