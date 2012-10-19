require 'test_helper'

class PacienteRespostaControllerTest < ActionController::TestCase
  setup do
    @paciente_respostum = paciente_resposta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paciente_resposta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente_respostum" do
    assert_difference('PacienteRespostum.count') do
      post :create, paciente_respostum: {  }
    end

    assert_redirected_to paciente_respostum_path(assigns(:paciente_respostum))
  end

  test "should show paciente_respostum" do
    get :show, id: @paciente_respostum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paciente_respostum
    assert_response :success
  end

  test "should update paciente_respostum" do
    put :update, id: @paciente_respostum, paciente_respostum: {  }
    assert_redirected_to paciente_respostum_path(assigns(:paciente_respostum))
  end

  test "should destroy paciente_respostum" do
    assert_difference('PacienteRespostum.count', -1) do
      delete :destroy, id: @paciente_respostum
    end

    assert_redirected_to paciente_resposta_path
  end
end
