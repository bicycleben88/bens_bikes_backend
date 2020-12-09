require 'test_helper'

class CartitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartitem = cartitems(:one)
  end

  test "should get index" do
    get cartitems_url, as: :json
    assert_response :success
  end

  test "should create cartitem" do
    assert_difference('Cartitem.count') do
      post cartitems_url, params: { cartitem: { image: @cartitem.image, name: @cartitem.name, order_id: @cartitem.order_id, price: @cartitem.price } }, as: :json
    end

    assert_response 201
  end

  test "should show cartitem" do
    get cartitem_url(@cartitem), as: :json
    assert_response :success
  end

  test "should update cartitem" do
    patch cartitem_url(@cartitem), params: { cartitem: { image: @cartitem.image, name: @cartitem.name, order_id: @cartitem.order_id, price: @cartitem.price } }, as: :json
    assert_response 200
  end

  test "should destroy cartitem" do
    assert_difference('Cartitem.count', -1) do
      delete cartitem_url(@cartitem), as: :json
    end

    assert_response 204
  end
end
