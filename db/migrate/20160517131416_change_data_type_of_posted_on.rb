class ChangeDataTypeOfPostedOn < ActiveRecord::Migration
  def change
    change_column :articles, :posted_on, :date
  end
end
