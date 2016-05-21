require 'elasticsearch/model'
class Article < ActiveRecord::Base
  include Searchable
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images
  has_many :comments, dependent: :destroy
  belongs_to :user

  searchkick text_start: [:text]  
  def search_data
    attributes.merge(
      comment_body: comments.map(&:body)
      )
  end
end

Article.import