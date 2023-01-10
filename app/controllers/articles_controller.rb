class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Object successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] = "Article was successfully updated"
        redirect_to @article
      else
        flash[:error] = "Something went wrong"
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_to articles_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to articles_url
    end
  end
  
  private 
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
  
end
