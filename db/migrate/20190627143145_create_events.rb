class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :organization, foreign_key: true
      t.string :name
      t.string :description
      t.string :complete
      t.string :img_url
      t.datetime :date

      t.timestamps
    end
  end
end
