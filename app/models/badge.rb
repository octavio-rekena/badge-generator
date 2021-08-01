class Badge < ApplicationRecord
  validates_presence_of :uuid, :recipient_name, :issue_date

  after_create :generate_hash
  after_create :submit_to_chainpoint

  private

  def generate_hash
    self.update_column(:hash, Digest::SHA256.hexdigest(uuid))
  end

  def submit_to_chainpoint
    hash = Digest::SHA256.hexdigest(DATA)
  end
end
  