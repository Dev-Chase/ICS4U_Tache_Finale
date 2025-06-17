require "application_system_test_case"

class SignalementsTest < ApplicationSystemTestCase
  setup do
    @signalement = signalements(:one)
  end

  test "visiting the index" do
    visit signalements_url
    assert_selector "h1", text: "Signalements"
  end

  test "should create signalement" do
    visit signalements_url
    click_on "New signalement"

    fill_in "Commentaire", with: @signalement.commentaire_id
    fill_in "Etat", with: @signalement.etat
    fill_in "Publication", with: @signalement.publication_id
    fill_in "Raison", with: @signalement.raison
    fill_in "Utilisateur", with: @signalement.utilisateur_id
    click_on "Create Signalement"

    assert_text "Signalement was successfully created"
    click_on "Back"
  end

  test "should update Signalement" do
    visit signalement_url(@signalement)
    click_on "Edit this signalement", match: :first

    fill_in "Commentaire", with: @signalement.commentaire_id
    fill_in "Etat", with: @signalement.etat
    fill_in "Publication", with: @signalement.publication_id
    fill_in "Raison", with: @signalement.raison
    fill_in "Utilisateur", with: @signalement.utilisateur_id
    click_on "Update Signalement"

    assert_text "Signalement was successfully updated"
    click_on "Back"
  end

  test "should destroy Signalement" do
    visit signalement_url(@signalement)
    click_on "Destroy this signalement", match: :first

    assert_text "Signalement was successfully destroyed"
  end
end
