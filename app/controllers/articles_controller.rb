class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update]
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "The article was published successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      flash[:sucess] = "The article was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:body, :title)
  end
end
