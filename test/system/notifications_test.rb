require "application_system_test_case"

class NotificationsTest < ApplicationSystemTestCase
  setup do
    @notification = notifications(:one)
  end

  test "visiting the index" do
    visit notifications_url
    assert_selector "h1", text: "Notifications"
  end

  test "should create notification" do
    visit notifications_url
    click_on "New notification"

    fill_in "Commentaire", with: @notification.commentaire_id
    fill_in "Date", with: @notification.date
    check "Lu" if @notification.lu
    fill_in "Publication", with: @notification.publication_id
    fill_in "Source utilisateur", with: @notification.source_utilisateur_id
    fill_in "Type", with: @notification.type
    fill_in "Utilisateur", with: @notification.utilisateur_id
    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "should update Notification" do
    visit notification_url(@notification)
    click_on "Edit this notification", match: :first

    fill_in "Commentaire", with: @notification.commentaire_id
    fill_in "Date", with: @notification.date.to_s
    check "Lu" if @notification.lu
    fill_in "Publication", with: @notification.publication_id
    fill_in "Source utilisateur", with: @notification.source_utilisateur_id
    fill_in "Type", with: @notification.type
    fill_in "Utilisateur", with: @notification.utilisateur_id
    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "should destroy Notification" do
    visit notification_url(@notification)
    click_on "Destroy this notification", match: :first

    assert_text "Notification was successfully destroyed"
  end
end
