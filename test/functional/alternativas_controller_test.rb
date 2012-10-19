require 'test_helper'

class AlternativasControllerTest < ActionController::TestCase
  setup do
    @alternativa = alternativas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alternativas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alternativa" do
    assert_difference('Alternativa.count') do
      post :create, alternativa: {  }
    end

    assert_redirected_to alternativa_path(assigns(:alternativa))
  end

  test "should show alternativa" do
    get :show, id: @alternativa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @alternativa
    assert_response :success
  end

  test "should update alternativa" do
    put :update, id: @alternativa, alternativa: {  }
    assert_redirected_to alternativa_path(assigns(:alternativa))
  end

  test "should destroy alternativa" do
    assert_difference('Alternativa.count', -1) do
      delete :destroy, id: @alternativa
    end

    assert_redirected_to alternativas_path
  end
end
