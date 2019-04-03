class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, index: { unique: true }
      t.string :name
      t.string :email
      t.string :image_url

      t.timestamps
    end
  end
end
