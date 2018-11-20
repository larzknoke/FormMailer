class StartController < ApplicationController
  before_filter :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
    @forms = Form.all
    @posts = Post.all
  end

end
