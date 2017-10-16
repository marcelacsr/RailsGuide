Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  # articles has many comments and many comments has one article
  resources :articles do
    resources :comments
    # /articles/:article_id/comments/
    # This creates comments as a nested resource within articles.
    # This is another part of capturing the hierarchical
    # relationship that exists between articles and comments.
    # It's common to have resources that are logically
    # children of other resources.
    # Nested routes allow you to capture this relationship
    # in your routing.
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
