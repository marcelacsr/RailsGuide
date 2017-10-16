class CreateArticles < ActiveRecord::Migration[5.1]
  # The above migration creates a method named change which
  # will be called when you run this migration. The action
  # defined in this method is also reversible, which means
  # Rails knows how to reverse the change made by this migration,
  # in case you want to reverse it later. When you run this
  # migration it will create an articles table with one string
  # column and a text column.
  # It also creates two timestamp fields to allow Rails
  # to track article creation and update times.
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
