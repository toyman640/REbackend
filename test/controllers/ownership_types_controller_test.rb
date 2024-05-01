require 'test_helper'

class OwnershipTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ownership_type = ownership_types(:one)
  end

  test 'should get index' do
    get ownership_types_url, as: :json
    assert_response :success
  end

  test 'should create ownership_type' do
    assert_difference('OwnershipType.count') do
      post ownership_types_url,
           params: { ownership_type: { description: @ownership_type.description,
                                       name: @ownership_type.name } }, as: :json
    end

    assert_response :created
  end

  test 'should show ownership_type' do
    get ownership_type_url(@ownership_type), as: :json
    assert_response :success
  end

  test 'should update ownership_type' do
    patch ownership_type_url(@ownership_type),
          params: { ownership_type: { description: @ownership_type.description,
                                      name: @ownership_type.name } }, as: :json
    assert_response :success
  end

  test 'should destroy ownership_type' do
    assert_difference('OwnershipType.count', -1) do
      delete ownership_type_url(@ownership_type), as: :json
    end

    assert_response :no_content
  end
end
