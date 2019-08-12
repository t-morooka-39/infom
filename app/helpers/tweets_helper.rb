module TweetsHelper
  def view_images(tweet)
    buffer = "".html_safe
    tweet.images.order(:id)&.each do |image|
      buffer << render_tweet_image(image)
    end
    buffer
  end

  private
   def render_tweet_image(image)
    content_tag(:div) do
      image_tag image.data.variant(resize: "300x>")
    end
   end
end
