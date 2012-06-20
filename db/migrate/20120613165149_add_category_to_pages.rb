class AddCategoryToPages < ActiveRecord::Migration
  def change
    add_column :pages, :category, :string
  end
end
