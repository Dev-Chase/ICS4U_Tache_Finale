class Publication < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :utilisateur
  has_many :commentaires, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :enregistres, dependent: :destroy
  has_many :signalements, dependent: :destroy

  has_one_attached :media

  def description 
	  I18n.locale = :fr
    ret = "Publiée par #{utilisateur.surnom}, il y a #{time_ago_in_words(created_at)}"
	  I18n.locale = :en
	  return ret
  end
end
