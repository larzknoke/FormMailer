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

    if form.customer.apikey == request.headers["API-KEY"]
      content = params[:content].to_json
      post = Post.new(:sender => request.remote_ip, :content => content)

      #save post
      if post.save
        form.posts << post
      end

      #send mail
      Mailer.contact_email(post).deliver

      # delete content if private
      post.content = '{"PRIVATE":"CONTENT"}' if form.customer.private_content
      post.save


      render :json => {success: true}, :status => 200
    else
      render :json => {error: "unauthorized"}, :status => 401
    end


  end
end
