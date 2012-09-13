class Api::V1::PostsController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def index
    @posts = Post.all
  end

  def create
    user = User.find_by_authentication_token(params[:authentication_token])
    post = user.posts.new(params[:post])

    if post.save
      return render status: 200, text: 'Success'
    end

    render status: 500, text: 'Failure'
  end
end
