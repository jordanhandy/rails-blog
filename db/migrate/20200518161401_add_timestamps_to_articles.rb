class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  def change
    # add_column command is used to add columns to database
    # add_column :data, :column, :format
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
