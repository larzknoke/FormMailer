class Customer < ActiveRecord::Base
  has_many :forms
  before_create :get_apikey


  def get_apikey
      self.apikey = SecureRandom.urlsafe_base64
  end
end
