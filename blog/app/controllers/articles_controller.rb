class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = user_signed_in? ? Article.all.sorted : Article.published.sorted
  end

  def show
    @article = user_signed_in? ? Article.find(params[:id]) : Article.published.find(params[:id])
  rescue
    redirect_to root_path
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end
  
  private
    # parameter filtering
    def article_params
      params.require(:article).permit(:title, :body, :status, :published_at)
    end  
end
