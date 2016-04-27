class Comment < ActiveRecord::Base
  include Searchable
  belongs_to :article
end
Comment.import