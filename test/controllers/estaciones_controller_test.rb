require 'test_helper'

class EstacionesControllerTest < ActionController::TestCase
  test "should get nombre:string" do
    get :nombre:string
    assert_response :success
  end

  test "should get indice:int" do
    get :indice:int
    assert_response :success
  end

  test "should get dinosaurio:reference" do
    get :dinosaurio:reference
    assert_response :success
  end

end
