class PostController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
  	@post = Post.new
  end

  def create
  	@post = current_user.posts.build(post_params)
  	if @post.save?
  		flash[:success] = "Your post was created"
  		redirect_to root_url
  	else
  		render 'new'
  		flash.now[:danger] = "Invalid post"
  	end
  end

  def index
  	@user = User.find(params[:id])

  end


  private 

  def logged_in_user
  	unless logged_in?
  		flash[:danger] = "Please log in"
  		redirect_to root_url
  	end
  end

  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
end
