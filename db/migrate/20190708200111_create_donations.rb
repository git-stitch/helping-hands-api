class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.string :charge_id

      t.timestamps
    end
  end
end
