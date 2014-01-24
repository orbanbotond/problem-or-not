require 'test_helper'

class LinkComponentsControllerTest < ActionController::TestCase
  setup do
    @link_component = link_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:link_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link_component" do
    assert_difference('LinkComponent.count') do
      post :create, link_component: { link: @link_component.link }
    end

    assert_redirected_to link_component_path(assigns(:link_component))
  end

  test "should show link_component" do
    get :show, id: @link_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @link_component
    assert_response :success
  end

  test "should update link_component" do
    patch :update, id: @link_component, link_component: { link: @link_component.link }
    assert_redirected_to link_component_path(assigns(:link_component))
  end

  test "should destroy link_component" do
    assert_difference('LinkComponent.count', -1) do
      delete :destroy, id: @link_component
    end

    assert_redirected_to link_components_path
  end
end
