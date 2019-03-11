class CreateKnowledges < ActiveRecord::Migration[5.2]
  def change
    create_table :knowledges do |t|
      t.string :url
      t.string :title
      t.integer :understanding
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
