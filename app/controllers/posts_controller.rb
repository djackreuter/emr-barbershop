class PostsController < ApplicationController
  before_action :find_postable
  def new
    @post = Post.new
  end

  def edit
    @post = @postable.posts.find(params[:id])
  end

  def create
    @post = @postable.posts.create(post_params)
    respond_to do |format|
      if @post.save
        format.js
      else
        flash[:alert] = 'Something bad happened and your post wasn\'t published. Try again'
        render template 'posts/new'
      end
    end
  end

  def update
    @post = @postable.posts.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(post_params)
        format.js
      else
        flash[:alert] = 'Something bad happened and your post wasn\'t updated. Try again'
        render template 'posts/edit'
      end
    end
  end

  def destroy
    @post = @postable.posts.find(params[:id])
    @post.destroy
    redirect_to pollymorphic_path(@postable)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_postable
    if params[:user_id].present?
      @postable = User.find(params[:user_id])
    elsif params[:barbershop_id].present?
      @postable = Barbershop.find(params[:barbershop_id])
    end
  end
end
