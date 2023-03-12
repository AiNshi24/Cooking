class CreateTagRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relationships do |t|
      t.references :tag, foreign_key: true, null: false
      t.references :recipe, foreign_key: true, null: false
      t.timestamps
    end
  end
end
