class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # ----- 追加 ----- #
      t.string :provider
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :image
      # ----- ／追加 ----- #

      t.timestamps
    end
  end
end
