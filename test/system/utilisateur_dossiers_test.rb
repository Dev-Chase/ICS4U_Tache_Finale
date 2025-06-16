require "application_system_test_case"

class UtilisateurDossiersTest < ApplicationSystemTestCase
  setup do
    @utilisateur_dossier = utilisateur_dossiers(:one)
  end

  test "visiting the index" do
    visit utilisateur_dossiers_url
    assert_selector "h1", text: "Utilisateur dossiers"
  end

  test "should create utilisateur dossier" do
    visit utilisateur_dossiers_url
    click_on "New utilisateur dossier"

    fill_in "Nom", with: @utilisateur_dossier.nom
    fill_in "Utilisateur", with: @utilisateur_dossier.utilisateur_id
    click_on "Create Utilisateur dossier"

    assert_text "Utilisateur dossier was successfully created"
    click_on "Back"
  end

  test "should update Utilisateur dossier" do
    visit utilisateur_dossier_url(@utilisateur_dossier)
    click_on "Edit this utilisateur dossier", match: :first

    fill_in "Nom", with: @utilisateur_dossier.nom
    fill_in "Utilisateur", with: @utilisateur_dossier.utilisateur_id
    click_on "Update Utilisateur dossier"

    assert_text "Utilisateur dossier was successfully updated"
    click_on "Back"
  end

  test "should destroy Utilisateur dossier" do
    visit utilisateur_dossier_url(@utilisateur_dossier)
    click_on "Destroy this utilisateur dossier", match: :first

    assert_text "Utilisateur dossier was successfully destroyed"
  end
end
