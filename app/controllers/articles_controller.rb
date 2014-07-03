class ArticlesController < ApplicationController

  def index
    @articles = Article.order(created_at: :desc)
    @article =  Article.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root
    else
      render :new
    end
  end

  def article_params
    params.require(:article).permit(:title, :url)
  end

end
