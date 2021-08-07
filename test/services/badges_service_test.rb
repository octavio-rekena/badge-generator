require 'test_helper'

class BadgesServiceTest < ActiveSupport::TestCase
  test 'should submit a hash to the Chainpoint network and get the proof_id' do
    badge = create(:badge)

    WebMock.allow_net_connect!

    stub_request(:post, endpoint)
      .to_return(
        body: correct_response_body(badge),
        headers: { 'Content-Type' => 'application/json' }
      )

    value = BadgesService.new(badge).submit_to_chainpoint

    assert value
    assert badge.proof_id.present?
    assert_equal 'f6d0-11eb-8ef4-01455c87c6', badge.proof_id
  end

  test 'should return false after submit the Chainpoint network and get the proof_id' do
    badge = create(:badge)

    WebMock.allow_net_connect!

    stub_request(:post, endpoint)
      .to_return(
        body: '',
        status: 500,
        headers: { 'Content-Type' => 'application/json' }
      )

    value = BadgesService.new(badge).submit_to_chainpoint

    assert_not value
    assert_not badge.proof_id.present?
  end

  private

  def endpoint
    "#{base_domain}/hashes"
  end

  def base_domain
    'http://3.136.178.15'
  end

  def correct_response_body(badge)
    "{\"hashes\":[{\"proof_id\":\"f6d0-11eb-8ef4-01455c87c6\",\"hash\":\"#{badge.hash}\"}]}"
  end
end
