require "test_helper"

class UtilisateurDossiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @utilisateur_dossier = utilisateur_dossiers(:one)
  end

  test "should get index" do
    get utilisateur_dossiers_url
    assert_response :success
  end

  test "should get new" do
    get new_utilisateur_dossier_url
    assert_response :success
  end

  test "should create utilisateur_dossier" do
    assert_difference("UtilisateurDossier.count") do
      post utilisateur_dossiers_url, params: { utilisateur_dossier: { nom: @utilisateur_dossier.nom, utilisateur_id: @utilisateur_dossier.utilisateur_id } }
    end

    assert_redirected_to utilisateur_dossier_url(UtilisateurDossier.last)
  end

  test "should show utilisateur_dossier" do
    get utilisateur_dossier_url(@utilisateur_dossier)
    assert_response :success
  end

  test "should get edit" do
    get edit_utilisateur_dossier_url(@utilisateur_dossier)
    assert_response :success
  end

  test "should update utilisateur_dossier" do
    patch utilisateur_dossier_url(@utilisateur_dossier), params: { utilisateur_dossier: { nom: @utilisateur_dossier.nom, utilisateur_id: @utilisateur_dossier.utilisateur_id } }
    assert_redirected_to utilisateur_dossier_url(@utilisateur_dossier)
  end

  test "should destroy utilisateur_dossier" do
    assert_difference("UtilisateurDossier.count", -1) do
      delete utilisateur_dossier_url(@utilisateur_dossier)
    end

    assert_redirected_to utilisateur_dossiers_url
  end
end
