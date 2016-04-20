class AddDetailsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :city_id, :integer
  end
end
