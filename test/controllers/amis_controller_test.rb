require "test_helper"

class AmisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ami = amis(:one)
  end

  test "should get index" do
    get amis_url
    assert_response :success
  end

  test "should get new" do
    get new_ami_url
    assert_response :success
  end

  test "should create ami" do
    assert_difference("Ami.count") do
      post amis_url, params: { ami: { status: @ami.status, utilisateur_1_id: @ami.utilisateur_1_id, utilisateur_2_id: @ami.utilisateur_2_id } }
    end

    assert_redirected_to ami_url(Ami.last)
  end

  test "should show ami" do
    get ami_url(@ami)
    assert_response :success
  end

  test "should get edit" do
    get edit_ami_url(@ami)
    assert_response :success
  end

  test "should update ami" do
    patch ami_url(@ami), params: { ami: { status: @ami.status, utilisateur_1_id: @ami.utilisateur_1_id, utilisateur_2_id: @ami.utilisateur_2_id } }
    assert_redirected_to ami_url(@ami)
  end

  test "should destroy ami" do
    assert_difference("Ami.count", -1) do
      delete ami_url(@ami)
    end

    assert_redirected_to amis_url
  end
end
