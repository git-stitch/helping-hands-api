class CreateOrganizationContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_contacts do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
