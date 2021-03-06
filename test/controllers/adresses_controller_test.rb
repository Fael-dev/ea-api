require "test_helper"

class AdressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adress = adresses(:one)
  end

  test "should get index" do
    get adresses_url, as: :json
    assert_response :success
  end

  test "should create adress" do
    assert_difference('Adress.count') do
      post adresses_url, params: { adress: { city: @adress.city, complement: @adress.complement, district: @adress.district, number: @adress.number, reference: @adress.reference, state: @adress.state, street: @adress.street, zip_code: @adress.zip_code } }, as: :json
    end

    assert_response 201
  end

  test "should show adress" do
    get adress_url(@adress), as: :json
    assert_response :success
  end

  test "should update adress" do
    patch adress_url(@adress), params: { adress: { city: @adress.city, complement: @adress.complement, district: @adress.district, number: @adress.number, reference: @adress.reference, state: @adress.state, street: @adress.street, zip_code: @adress.zip_code } }, as: :json
    assert_response 200
  end

  test "should destroy adress" do
    assert_difference('Adress.count', -1) do
      delete adress_url(@adress), as: :json
    end

    assert_response 204
  end
end
