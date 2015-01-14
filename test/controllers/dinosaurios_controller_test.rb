require 'test_helper'

class DinosauriosControllerTest < ActionController::TestCase
  setup do
    @dinosaurio = dinosaurios(:ankylosaurus)
    session[:user_id] = User.first.id
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
      post :create, dinosaurio: { descripciones_attributes: [{ contenido: "descripcion de pepe"}], nombre: "pepe", periodo_id: @dinosaurio.periodo.id }
    end

    assert_redirected_to dinosaurio_path(assigns(:dinosaurio))
  end

  test "dinosaurio sin descripcion" do
    assert_no_difference('Dinosaurio.count') do
      post :create, dinosaurio: {nombre: "pepe", periodo_id: @dinosaurio.periodo.id }
    end

    assert_template :new
  end

  test "dinosaurio sin nombre" do
    assert_no_difference('Dinosaurio.count') do
      post :create, dinosaurio: {descripciones_attributes: [{ contenido: "descripcion de pepe"}], periodo_id: @dinosaurio.periodo.id }
    end

    assert_template :new
  end  

  test "dinosaurio nombre repetido" do
    assert_no_difference('Dinosaurio.count') do
      post :create, dinosaurio: {nombre: "Ankylosaurus", descripciones_attributes: [{ contenido: "descripcion de pepe"}], periodo_id: @dinosaurio.periodo.id }
    end

    assert_template :new
  end

  test "dinosaurio sin periodo" do
    assert_no_difference('Dinosaurio.count') do
      post :create, dinosaurio: {nombre: "Pepe", descripciones_attributes: [{ contenido: "descripcion de pepe"}]}
    end

    assert_template :new
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
    nuevo_nombre = "pepe"
    nueva_descripcion_contenido = @dinosaurio.descripciones[0].contenido
    patch :update, id: @dinosaurio, dinosaurio: { descripciones_attributes: [{id: @dinosaurio.descripciones[0].id, contenido: nueva_descripcion_contenido}], nombre: nuevo_nombre, periodo: @dinosaurio.periodo }
    
    nuevo_dinosaurio = Dinosaurio.find(@dinosaurio.id)
    assert_equal nuevo_nombre, nuevo_dinosaurio.nombre
    assert_equal nueva_descripcion_contenido, @dinosaurio.descripciones[0].contenido
    assert_redirected_to dinosaurio_path(assigns(:dinosaurio))
  end

  test "should not destroy descripciones" do
    descripciones = []
    @dinosaurio.descripciones.each do |desc|
      descripciones << {id: desc.id, _destroy: true}
    end

    assert_no_difference('Descripcion.count') do
      patch :update, id: @dinosaurio, dinosaurio: { descripciones_attributes: descripciones}
    end
    assert_template :edit

  end

  test "should destroy dinosaurio" do
    assert_difference('Dinosaurio.count', -1) do
      delete :destroy, id: @dinosaurio
    end

    assert_redirected_to dinosaurios_path
  end
end
