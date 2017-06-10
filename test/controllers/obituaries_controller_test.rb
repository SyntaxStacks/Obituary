require 'test_helper'

class ObituariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @obituary = obituaries(:one)
  end

  test "should get index" do
    get obituaries_url
    assert_response :success
  end

  test "should get new" do
    get new_obituary_url
    assert_response :success
  end

  test "should create obituary" do
    assert_difference('Obituary.count') do
      post obituaries_url, params: { obituary: { birth_date: @obituary.birth_date, content: @obituary.content, death_date: @obituary.death_date, name: @obituary.name } }
    end

    assert_redirected_to obituary_url(Obituary.last)
  end

  test "should show obituary" do
    get obituary_url(@obituary)
    assert_response :success
  end

  test "should get edit" do
    get edit_obituary_url(@obituary)
    assert_response :success
  end

  test "should update obituary" do
    patch obituary_url(@obituary), params: { obituary: { birth_date: @obituary.birth_date, content: @obituary.content, death_date: @obituary.death_date, name: @obituary.name } }
    assert_redirected_to obituary_url(@obituary)
  end

  test "should destroy obituary" do
    assert_difference('Obituary.count', -1) do
      delete obituary_url(@obituary)
    end

    assert_redirected_to obituaries_url
  end
end
