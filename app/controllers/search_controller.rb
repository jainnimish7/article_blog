class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @response = []
    else
      @response = Elasticsearch::Model.search params[:q]
    end
  end
end
