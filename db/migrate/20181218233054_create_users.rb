class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :google_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :picture_url

      t.timestamps
    end
  end
end
