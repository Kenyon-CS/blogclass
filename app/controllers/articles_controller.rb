class ArticlesController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]

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

    # Separate the article from the keyword paramaters
  	@article_args=article_params.slice(:title, :body, :status)
  	@keywords_args=article_params.slice(:keywords)

	# Create a new article
    @article = Article.new(@article_args)
    
    # Get the IDs for the keywords
    keyword_ids = string_to_array(@keywords_args[:keywords])
    # Add an association between the article and each keyword
	keyword_ids.each { |id|
		@keyword = Keyword.find(id)
		@article.keywords << @keyword
	}
	
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
  	@article_args=article_params.slice(:title, :body, :status)
    @keywords_args=article_params.slice(:keywords)

    # Get the IDs for the keywords
    keyword_ids = string_to_array(@keywords_args[:keywords])
    # Clear the current keyword associations
    @article.keywords.clear
    
    # Add in the new keyword associations
	keyword_ids.each { |id|
		@keyword = Keyword.find(id)
		@article.keywords << @keyword
	}
	
    if @article.update(@article_args)
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
    def keyword_params
      params.require(:articles_keywords).permit(:keywords)
    end
    def string_to_array(string) 
  		string.scan(/\d+/).map(&:to_i) 
	end 

end