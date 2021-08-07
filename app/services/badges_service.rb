class BadgesService
  attr_accessor :badge

  def initialize(badge)
    @badge = badge
  end

  def submit_to_chainpoint
    return false unless badge.present? && badge.proof_id.nil?

    generate_hash unless badge.badge_hash.present?

    response = HTTParty.post endpoint,
      body: body,
      headers: headers

    if response.code == 200
      parsed_response = JSON.parse response.body
      badge.update_column(:proof_id, parsed_response['hashes'].first['proof_id'])
    else
      false
    end
  end

  private

  def generate_hash
    badge.update_column(:badge_hash, Digest::SHA256.hexdigest(badge.uuid))
  end

  def body
    { hashes: [badge.badge_hash] }.to_json
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end

  def endpoint
    "#{base_domain}/hashes"
  end

  def base_domain
    'http://3.136.178.15'
  end
end
