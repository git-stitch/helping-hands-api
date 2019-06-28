class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :logo_url
      t.string :mission_statement
      t.string :bio
      t.string :homepage_url
      t.string :address

      t.timestamps
    end
  end
end
