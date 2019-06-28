class CreateOrganizationSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_socials do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :social_media_name
      t.string :url

      t.timestamps
    end
  end
end
