class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :uuid, index: true
      t.string :recipient_name
      t.string :hash
      t.string :proof_id
      t.datetime :issue_date
      t.timestamps
    end
  end
end
