class Comment < ActiveRecord::Base
#  include Searchable
  belongs_to :article
  searchkick
end
#Comment.import