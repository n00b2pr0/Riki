class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :page_id
      t.string :tag_name

      t.timestamps
    end
  end
end
