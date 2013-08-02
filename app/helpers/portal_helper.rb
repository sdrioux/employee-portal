module PortalHelper
  # Returns the String markup for a Gravatar profile image.
  def profile_image_for_user(user)
    image_tag Gravatar.new(user.email).image_url(size: 200), class: 'profile'
  end
end
