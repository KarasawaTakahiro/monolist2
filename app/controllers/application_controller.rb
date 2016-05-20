class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :mediumImage_to_largeImage

  # midiumImageをLargeImageに変換する
  def mediumImage_to_largeImage(img_url)
    img_url.gsub('?_ex=128x128', '')
  end


  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
