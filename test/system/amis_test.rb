require "application_system_test_case"

class AmisTest < ApplicationSystemTestCase
  setup do
    @ami = amis(:one)
  end

  test "visiting the index" do
    visit amis_url
    assert_selector "h1", text: "Amis"
  end

  test "should create ami" do
    visit amis_url
    click_on "New ami"

    fill_in "Status", with: @ami.status
    fill_in "Utilisateur 1", with: @ami.utilisateur_1_id
    fill_in "Utilisateur 2", with: @ami.utilisateur_2_id
    click_on "Create Ami"

    assert_text "Ami was successfully created"
    click_on "Back"
  end

  test "should update Ami" do
    visit ami_url(@ami)
    click_on "Edit this ami", match: :first

    fill_in "Status", with: @ami.status
    fill_in "Utilisateur 1", with: @ami.utilisateur_1_id
    fill_in "Utilisateur 2", with: @ami.utilisateur_2_id
    click_on "Update Ami"

    assert_text "Ami was successfully updated"
    click_on "Back"
  end

  test "should destroy Ami" do
    visit ami_url(@ami)
    click_on "Destroy this ami", match: :first

    assert_text "Ami was successfully destroyed"
  end
end
