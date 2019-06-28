class CreateOrganizationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_images do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
