class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post_validation = Post.new(post_params)
    if @post_validation.valid?
      @post.update(post_params)
      redirect_to post_path(@post)
    else
      render(:edit)
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
