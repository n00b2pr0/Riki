class AddPermalinkToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :permalink, :string
    add_index :pages, :permalink
  end
  def self.down
    remove_column :pages, :permalink
  end
end