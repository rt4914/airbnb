# frozen_string_literal: true

# Helper methods for the User Profile
module ProfileHelper
  def avatar_for(user, classes: "h-12 w-12 rounded-full" )
    user_name = user.name || "User"
    if user.avatar.attached?
      image_tag user.avatar, alt: user_name, class: classes
    else
      image_tag 'default_avatar.jpeg', alt: user_name, class: classes
    end
  end
end
