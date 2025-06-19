class HomeController < ApplicationController
  before_action :authenticate_utilisateur!, only: [ :mes_publications ]

  def page
    if utilisateur_signed_in?
      @publications = Publication.where("NOT utilisateur_id = ?", current_utilisateur.id).order(created_at: :desc).limit(10)
    else
      @publications = Publication.order(created_at: :desc).limit(10)
    end
  end

  def publications_amis
      @publications = Publication.joins("INNER JOIN amis ON publications.utilisateur_id = amis.utilisateur_1_id OR publications.id = amis.utilisateur_2_id").where("NOT publications.utilisateur_id=?", current_utilisateur.id).order(:created_at).limit(10)
  end

  def mes_publications
    @publications = Publication.where(utilisateur_id: current_utilisateur.id)
  end
end
