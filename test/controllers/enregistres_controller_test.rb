require "test_helper"

class EnregistresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enregistre = enregistres(:one)
  end

  test "should get index" do
    get enregistres_url
    assert_response :success
  end

  test "should get new" do
    get new_enregistre_url
    assert_response :success
  end

  test "should create enregistre" do
    assert_difference("Enregistre.count") do
      post enregistres_url, params: { enregistre: { publication_id: @enregistre.publication_id, utilisateur_dossier_id: @enregistre.utilisateur_dossier_id } }
    end

    assert_redirected_to enregistre_url(Enregistre.last)
  end

  test "should show enregistre" do
    get enregistre_url(@enregistre)
    assert_response :success
  end

  test "should get edit" do
    get edit_enregistre_url(@enregistre)
    assert_response :success
  end

  test "should update enregistre" do
    patch enregistre_url(@enregistre), params: { enregistre: { publication_id: @enregistre.publication_id, utilisateur_dossier_id: @enregistre.utilisateur_dossier_id } }
    assert_redirected_to enregistre_url(@enregistre)
  end

  test "should destroy enregistre" do
    assert_difference("Enregistre.count", -1) do
      delete enregistre_url(@enregistre)
    end

    assert_redirected_to enregistres_url
  end
end
