require 'test_helper'

class BadgeTest < ActiveSupport::TestCase
  def setup
    @badge = build(:badge)
  end

  should validate_presence_of(:uuid)
  should validate_presence_of(:recipient_name)

  test 'should has a valid factory' do
    assert @badge.valid?
  end
end
