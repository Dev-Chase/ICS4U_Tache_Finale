class HomeController < ApplicationController
  def page
    @publications = Publication.order(created_at: :desc).limit(5)
    # @publications = liked_posts_if_signed_in(Publication.order(created_at: :desc).limit(5))
  end
end
