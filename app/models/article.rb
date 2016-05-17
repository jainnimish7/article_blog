require 'elasticsearch/model'
class Article < ActiveRecord::Base
  include Searchable
  searchkick text_start: [:text]
  has_many :comments, dependent: :destroy
  
  def search_data
    attributes.merge(
      comment_body: comments.map(&:body)
      )
  end
end

Article.import