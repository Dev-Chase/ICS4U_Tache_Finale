require "application_system_test_case"

class EnregistresTest < ApplicationSystemTestCase
  setup do
    @enregistre = enregistres(:one)
  end

  test "visiting the index" do
    visit enregistres_url
    assert_selector "h1", text: "Enregistres"
  end

  test "should create enregistre" do
    visit enregistres_url
    click_on "New enregistre"

    fill_in "Publication", with: @enregistre.publication_id
    fill_in "Utilisateur dossier", with: @enregistre.utilisateur_dossier_id
    click_on "Create Enregistre"

    assert_text "Enregistre was successfully created"
    click_on "Back"
  end

  test "should update Enregistre" do
    visit enregistre_url(@enregistre)
    click_on "Edit this enregistre", match: :first

    fill_in "Publication", with: @enregistre.publication_id
    fill_in "Utilisateur dossier", with: @enregistre.utilisateur_dossier_id
    click_on "Update Enregistre"

    assert_text "Enregistre was successfully updated"
    click_on "Back"
  end

  test "should destroy Enregistre" do
    visit enregistre_url(@enregistre)
    click_on "Destroy this enregistre", match: :first

    assert_text "Enregistre was successfully destroyed"
  end
end
