class ArticlesController < ApplicationController
  def new
    # With the validation now in place, when you call @article.save on
    # an invalid article, it will return false.
    # The new action is now creating a new instance variable called
    # @article
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    # (remember that params[:article] contains the attributes we're interested in)
    # The params method is the object which represents
    # the parameters (or fields) coming in from the form.
    # example URL: http://www.example.com/?username=dhh&email=dhh@email.com.
    # In this URL, params[:username] would equal "dhh"
    # and params[:email] would equal "dhh@email.com".

    # 1. @article = Article.new(params[:article])
    # (remember that params[:article] contains the attributes we're interested in)

    # 2. @article = Article.new(params.require(:article).permit(:title, :text))
    # have to whitelist our controller parameters to prevent wrongful mass assignment

    @article = Article.new(article_params)

    # we need to change the create action to use the
    # new Article model to save the data in the database.
    # @article.save is responsible for saving the model in the database
    # @article.save returns a boolean indicating whether the article was saved or not.
    if @article.save
      redirect_to @article # redirect the user to the show action
    else # caso o artigo esteja sem title, ele não vai salvar, então renderiza
      # pra new.html, por causa da validates: presence true no model
      render 'new'
    # inside the create action we use render instead of redirect_to when save
    # returns false. The render method is used so that the @article object is
    # passed back to the new template when it is rendered.
    # This rendering is done within the same request as the form submission,
    # whereas the redirect_to will tell the browser to issue another request.
    end
  end

  def update
    # Quando clica no submit do form de edit
    @article = Article.find(params[:id])
    if @article.update(article_params)
      # It is not necessary to pass all the attributes to update.
      # For example, if @article.update(title: 'A new title') was called,
      # Rails would only update the title attribute, leaving all other
      # attributes untouched.
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
    # also use an instance variable (prefixed with @) to hold a
    # reference to the article object. We do this because Rails
    # will pass all instance variables to the view Article.find
    # to find the article we're interested in, passing in params[:id]
    # to get the :id parameter from the request
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

private

  def article_params
    # strong parameters, which requires us to tell Rails exactly
    # which parameters are allowed into our controller actions.
    # have to whitelist our controller parameters to prevent wrongful
    # mass assignment
    params.require(:article).permit(:title, :text)
  end
end
