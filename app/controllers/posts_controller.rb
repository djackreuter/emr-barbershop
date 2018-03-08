class PostsController < ApplicationController
  def new
    @barbershop = Barbershop.find(params[:barbershop_id])
    @post = Post.new
  end

  def edit
    @barbershop = Barbershop.find(params[:barbershop_id])
    @post = @barbershop.posts.find(params[:id])
  end

  def create
    @barbershop = Barbershop.find(params[:barbershop_id])
    @post = @barbershop.posts.create(post_params)
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
    @barbershop = Barbershop.find(params[:barbershop_id])
    @post = @barbershop.posts.find(params[:id])
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
    @barbershop = Barbershop.find(params[:barbershop_id])
    @post = @barbershop.posts.find(params[:id])
    @post.destroy
    redirect_to barbershop_path(@barbershop)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
