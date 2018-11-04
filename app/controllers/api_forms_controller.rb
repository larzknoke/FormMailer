class ApiFormsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    render :json => "Index works!"
  end

  def show
    id = params[:id]
    render :json => id
  end

  def create
    form = Form.find(params[:id])

    content = params[:content].to_json
    post = Post.new(:sender => "test", :content => content)
    if post.save
      form.posts << post
    end
    render :json => post.content
  end
end
