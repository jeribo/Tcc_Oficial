class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @articles }
    end
  end
  #get /article/1
  def show
    @article = Article.find(params[:id])
    
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @article }
    end    
  end
  
  #get /article/new
  def new
    @article = Article.new
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @article }
    end    
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(params[:article])
    
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: unprocessable_entity }
      end    
    end
  end
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end  
end