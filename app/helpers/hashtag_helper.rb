module HashtagHelper

  # Set image with the most representative image for show the tweet.
  #
  # @param [String] image The image field url if the tweet have one.
  # @param [Array<String>] images The array with all the site images.
  #
  # @return [String] Best image to show in th tweet.
  def select_image(image, images)
    image || images[1]
  end

  # Process div share information to show in the view
  #
  # @param [String] url The shared url to publish.
  def show_share_content(url)
    if url_exists?(url)
      content_tag(:div, class: 'share', data: {url: url, path: share_path}) do
        content_tag(:div, class: 'text-right') do
          content_tag(:p, image_tag('loading.gif'))
        end
      end
    end

  end

end