class CreateKnowledges < ActiveRecord::Migration[5.2]
  def change
    create_table :knowledges do |t|
      t.string :url
      t.string :title
      t.decimal :understanding, precision: 4, scale: 2
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
