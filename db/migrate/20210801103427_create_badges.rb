class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :uuid, index: true
      t.string :recipient_name
      t.string :badge_hash
      t.string :proof_id
      t.timestamps
    end
  end
end
