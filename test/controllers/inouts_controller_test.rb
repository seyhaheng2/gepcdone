require 'test_helper'

class InoutsControllerTest < ActionController::TestCase
  setup do
    @inout = inouts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inouts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inout" do
    assert_difference('Inout.count') do
      post :create, inout: { name: @inout.name }
    end

    assert_redirected_to inout_path(assigns(:inout))
  end

  test "should show inout" do
    get :show, id: @inout
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inout
    assert_response :success
  end

  test "should update inout" do
    patch :update, id: @inout, inout: { name: @inout.name }
    assert_redirected_to inout_path(assigns(:inout))
  end

  test "should destroy inout" do
    assert_difference('Inout.count', -1) do
      delete :destroy, id: @inout
    end

    assert_redirected_to inouts_path
  end
end
