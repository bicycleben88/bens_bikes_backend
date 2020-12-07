require 'test_helper'

class FixPriceColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fix_price_column = fix_price_columns(:one)
  end

  test "should get index" do
    get fix_price_columns_url, as: :json
    assert_response :success
  end

  test "should create fix_price_column" do
    assert_difference('FixPriceColumn.count') do
      post fix_price_columns_url, params: { fix_price_column: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show fix_price_column" do
    get fix_price_column_url(@fix_price_column), as: :json
    assert_response :success
  end

  test "should update fix_price_column" do
    patch fix_price_column_url(@fix_price_column), params: { fix_price_column: {  } }, as: :json
    assert_response 200
  end

  test "should destroy fix_price_column" do
    assert_difference('FixPriceColumn.count', -1) do
      delete fix_price_column_url(@fix_price_column), as: :json
    end

    assert_response 204
  end
end
