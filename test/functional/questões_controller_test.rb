require 'test_helper'

class QuestõesControllerTest < ActionController::TestCase
  setup do
    @questõe = questões(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questões)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questõe" do
    assert_difference('Questõe.count') do
      post :create, questõe: {  }
    end

    assert_redirected_to questõe_path(assigns(:questõe))
  end

  test "should show questõe" do
    get :show, id: @questõe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questõe
    assert_response :success
  end

  test "should update questõe" do
    put :update, id: @questõe, questõe: {  }
    assert_redirected_to questõe_path(assigns(:questõe))
  end

  test "should destroy questõe" do
    assert_difference('Questõe.count', -1) do
      delete :destroy, id: @questõe
    end

    assert_redirected_to questões_path
  end
end
