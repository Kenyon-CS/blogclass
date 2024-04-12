class KeywordsController < ApplicationController
  def index
    @keywords = Keyword.all
  end

  def show
    @keyword = Keyword.find(params[:id])
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)

    if @keyword.save
      redirect_to @keyword
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @keyword = Keyword.find(params[:id])
  end

  def update
    @keyword = Keyword.find(params[:id])

    if @keyword.update(keyword_params)
      redirect_to @keyword
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @keyword = Keyword.find(params[:id])
    @keyword.destroy

    redirect_to "/keywords", status: :see_other
  end
  
  private
    def keyword_params
      puts "keyword: #{params}"
      params.require(:keyword).permit(:word)
    end

end
