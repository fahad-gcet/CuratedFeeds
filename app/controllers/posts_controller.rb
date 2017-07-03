class PostsController < ApplicationController
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def feed
    @my_interests = current_user.tag_ids
    if @my_interests.any?
      @posts = Post.select { |p| (p.tag_ids & @my_interests).any? }
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post was created successfully!'
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post was updated successfully!'
      redirect_to @post
    else
      flash.now[:danger] = 'Error while submitting post!'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_url
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :description, tag_ids: [])
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
