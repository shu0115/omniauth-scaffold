class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :image
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
