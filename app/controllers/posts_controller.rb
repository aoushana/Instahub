class PostsController < ApplicationController
  #by adding this before_action to the top of our controller to set the @post variable for specific actions
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  #get all of your posts that will be submitted now and in the future. So create an instance variable that
  #collects all of t he posts in your Post model. lets call our instance variable @posts. all we want to do
  #capture all of the posts in the Post model.
  @posts = Post.all
  end

  def new
  @post = Post.new
  end

  def create
  #we are using post_params as argument to to the create method. post_params will be a private method..
  #it can be called from outside this class.
    #if something goes wrong when submtitting a form, create a if/else statement.
    #if your post is successfully creatd, redirect to the index page, else render the new page. This code
    #also flashes the user a message upon completing an action
   if @post = Post.create(post_params)
     flash[:success] = "Your post has been created!"
    redirect_to posts_path
   else
     flash.now[:alert] = "Your new post couldn't be created! Please check the form."
     render :new
     end
  end


    def show
    #this has the ability to show a single post. we want this action to have a @post instance variable that points
    # to the specific post we are referring to.
    end

    def edit
    #we want to include an instance variable that refers to the specific post we are looking at.
    end

  def update
    #this updates the database
    #if your post is successfully updated, redirect to the index page, else render the edit page.
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render :edit
    end
  end

  def destroy
    #this is the initial step to create a destroy action in the controller that deletes the specific
    #record and then you will need to link to that action on your index view with the addition of a :destroy
    # method.Then we wnt you to redirect back to the index. Simply create a link on the edit page for now
    # so all of our users can delete each others post at will.
    @post.destroy
    redirect_to root_path
  end
end


private
#image and our caption text can be accepted as the parameters in our form.
#now that the info is being saved in the create action, we need to redirect the user to somewhere useful.
#lets send them back to the index action for the time being with the redirect_to_method
  def post_params
  params.require(:post).permit(:image, :caption)
  end

  def set_post
  #we are looking for by the id parameter and assigns it to the instance variable @post
  @post = Post.find(params[:id])
  end
