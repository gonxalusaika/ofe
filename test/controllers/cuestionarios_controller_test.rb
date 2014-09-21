require 'test_helper'

class CuestionariosControllerTest < ActionController::TestCase
  setup do
    @cuestionario = cuestionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuestionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuestionario" do
    assert_difference('Cuestionario.count') do
      post :create, cuestionario: { nombre: @cuestionario.nombre, preguntas: @cuestionario.preguntas }
    end

    assert_redirected_to cuestionario_path(assigns(:cuestionario))
  end

  test "should show cuestionario" do
    get :show, id: @cuestionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuestionario
    assert_response :success
  end

  test "should update cuestionario" do
    patch :update, id: @cuestionario, cuestionario: { nombre: @cuestionario.nombre, preguntas: @cuestionario.preguntas }
    assert_redirected_to cuestionario_path(assigns(:cuestionario))
  end

  test "should destroy cuestionario" do
    assert_difference('Cuestionario.count', -1) do
      delete :destroy, id: @cuestionario
    end

    assert_redirected_to cuestionarios_path
  end
end
