require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  def setup
  end

  test 'should get index' do
    create(:badge)
    get badges_path
    assert_response :success
  end

  test 'should get show' do
    bagde = create(:badge)
    get badge_path(bagde)
    assert_response :success
  end

  test 'should get new' do
    get new_badge_path
    assert_response :success
  end

  test 'should create a badge' do
    assert_difference('Badge.count') do
      post badges_path, params: valid_badge_params
    end
    badge = Badge.last
    assert_redirected_to badge_path(badge)
  end

  test 'should not create a badge if invalid params' do
    assert_no_difference('Badge.count') do
      post badges_path, params: invalid_badge_params
    end

    assert_template :new
  end

  private

  def valid_badge_params
    { badge: { uuid: '2977c0-f6d0-11eb-8ef4-01442556', recipient_name: 'Test Recipient' } }
  end

  def invalid_badge_params
    { badge: { uuid: nil } }
  end
end
