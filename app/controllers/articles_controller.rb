class ArticlesController < ApplicationController

http_basic_authenticate_with name: "jps", password: "kenyon", except: [:index, :show]

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
    puts("CREATE ARTICLE: #{article_params}")
    @article = Article.new(article_params)
	@article_keyword = Article_keyword.new(keyword_params)
	
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
    def article_params
      puts "article: #{params}"
      params.require(:article).permit(:title, :body, :status, :keywords)
    end

end