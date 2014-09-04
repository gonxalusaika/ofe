require 'test_helper'

class DinosauriosControllerTest < ActionController::TestCase
  setup do
    @dinosaurio = dinosaurios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinosaurios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinosaurio" do
    assert_difference('Dinosaurio.count') do
      post :create, dinosaurio: { descripcion: @dinosaurio.descripcion, nombre: @dinosaurio.nombre, periodo: @dinosaurio.periodo }
    end

    assert_redirected_to dinosaurio_path(assigns(:dinosaurio))
  end

  test "should show dinosaurio" do
    get :show, id: @dinosaurio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dinosaurio
    assert_response :success
  end

  test "should update dinosaurio" do
    patch :update, id: @dinosaurio, dinosaurio: { descripcion: @dinosaurio.descripcion, nombre: @dinosaurio.nombre, periodo: @dinosaurio.periodo }
    assert_redirected_to dinosaurio_path(assigns(:dinosaurio))
  end

  test "should destroy dinosaurio" do
    assert_difference('Dinosaurio.count', -1) do
      delete :destroy, id: @dinosaurio
    end

    assert_redirected_to dinosaurios_path
  end
end
