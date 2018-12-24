class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.text :snippet
      t.string :display_url
      t.text :body
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
