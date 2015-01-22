require 'test_helper'

class PeriodosControllerTest < ActionController::TestCase
  setup do
    @periodo = periodos(:one)
    session[:user_id] = User.first.id
  end

  test "index should redirect to login" do
    session[:user_id] = nil
    get :index
    assert_redirected_to login_path
  end
  test "new should redirect to login" do
    session[:user_id] = nil
    get :new
    assert_redirected_to login_path
  end
  test "create should redirect to login" do
    session[:user_id] = nil

    assert_no_difference('Periodo.count') do
      post :create, periodo: { descripcion: @periodo.descripcion, nombre: @periodo.nombre }
    end

    assert_redirected_to login_path
  end

  test "show should redirect to login" do
    session[:user_id] = nil
    get :show, id: @periodo    
    assert_redirected_to login_path
  end

  test "edit should redirect to login" do
    session[:user_id] = nil
    get :edit, id: @periodo
    assert_redirected_to login_path
  end

  test "update should redirect to login" do
    session[:user_id] = nil
    patch :update, id: @periodo, periodo: { descripcion: @periodo.descripcion, nombre: @periodo.nombre }
    assert_redirected_to login_path
  end

  test "destroy should redirect to login" do
    session[:user_id] = nil
    assert_no_difference('Periodo.count') do
      delete :destroy, id: @periodo
    end    
    assert_redirected_to login_path
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodo" do
    assert_difference('Periodo.count') do
      post :create, periodo: { descripcion: @periodo.descripcion, nombre: @periodo.nombre }
    end

    assert_redirected_to periodo_path(assigns(:periodo))
  end

  test "should show periodo" do
    get :show, id: @periodo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @periodo
    assert_response :success
  end

  test "should update periodo" do
    patch :update, id: @periodo, periodo: { descripcion: @periodo.descripcion, nombre: @periodo.nombre }
    assert_redirected_to periodo_path(assigns(:periodo))
  end

  test "should destroy periodo" do
    assert_difference('Periodo.count', -1) do
      delete :destroy, id: @periodo
    end

    assert_redirected_to periodos_path
  end
end
