require 'elasticsearch/model'
class Article < ActiveRecord::Base
  include Searchable

  has_many :comments, dependent: :destroy
  
end

Article.import