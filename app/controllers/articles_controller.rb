class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @article.images.build
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Successfully published'
      redirect_to @article
    else
      flash[:danger] = 'Not published article'
      render 'new'
      #render :new
      #redirect_to new_article_path
    end
  end
  # for autocomplete
  def autocomplete
    render json: Article.search(params[:term], fields: [{text: :text_start}, :comment_body, :title], highlight: true, limit: 10).map(&:text)
  end

  def edit
    @article = Article.find(params[:id])
    @article.images.build
  end

  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      flash[:success] = 'Article is updated'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    article = Article.find(params[:id])
    flash[:notice] = 'Successfully Destroyed'
    article.destroy
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

private
  def article_params
    params.require(:article).permit(:title, :text, :posted_on, images_attributes: [:photo, :id, :caption, :photo_file_name, :_destroy])
  end
  
end