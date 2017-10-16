class Article < ApplicationRecord
  # Active Record is smart enough to automatically map column names
  # to model attributes, which means you don't have to declare
  # attributes inside Rails models, as that will be done
  # automatically by Active Record.
  # every Rails model can be initialized with its respective attributes,
  # which are automatically mapped to the respective database columns
  # There isn't much to this file - but note that the Article class
  # inherits from ApplicationRecord. ApplicationRecord inherits from
  # ActiveRecord::Base which supplies a great deal of functionality
  # to your Rails models for free, including basic database CRUD
  # (Create, Read, Update, Destroy) operations, data validation,
  # as well as sophisticated search support and the ability to relate
  # multiple models to one another.

  validates :title, presence: true, length: { minimum:5 }
#   all articles have a title that is at least five characters long
#   presence: This helper validates that the specified attributes are not empty.
#   title cannot be empty (presence:true)
  has_many :comments
end
