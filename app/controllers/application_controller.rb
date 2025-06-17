class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # before_action :authenticate_utilisateur! # TODO: remove?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def liked_posts_if_signed_in(publications)
  #   return publications unless utilisateur_signed_in?
  #
  #   liked_ids = current_utilisateur.likes.where(publication_id: publications.map(&:id)).pluck(:publication_id)
  #
  #   publications.each { |p| p.liked = liked_ids.include?(p.id) }
  #
  #   return publications
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surnom, :prenom, :age, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:surnom, :prenom, :age, :bio])
  end
end
