module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    settings index: { number_of_shards: 1 } do
      mappings dynamic: 'false' do
        indexes :title, analyzer: 'english'
        indexes :text, analyzer: 'english'
        indexes :commenter, analyzer: 'english'
        indexes :body, analyzer: 'english'
      end
    end

    def self.search(query)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ['_all']
            }
          },
          highlight: {
            pre_tags: ['<em>'],
            post_tags: ['</em>'],
            fields: {
              title: {},
              text: {},
              commenter: {},
              body: {}
            }
          }
        }
      )
    end
    
    after_commit on: [:create] do
      __elasticsearch__.index_document
    end

  end
end