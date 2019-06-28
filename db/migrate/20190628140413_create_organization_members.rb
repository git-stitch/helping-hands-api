class CreateOrganizationMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_members do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
