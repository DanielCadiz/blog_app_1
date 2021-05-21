class ArticlesController < ApplicationController
    
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params)

        if @article.valid? 
            @article.save
            flash[:notice] = "Created Successfully."
            redirect_to articles_path
        else
            render :new
        end 
    end    
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Updated Successfully."
            redirect_to articles_path
        else
            flash[:notice] = "Something went wrong."
            render :edit
        end
    end
    
      # DELETE /posts/1 or /posts/1.json
    def delete
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article has been deleted."
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
