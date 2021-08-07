class Badge < ApplicationRecord
  validates_presence_of :uuid, :recipient_name
end
