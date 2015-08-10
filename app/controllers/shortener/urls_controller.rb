module Shortener
  class UrlsController < Shortener::ApplicationController
    def show
      url = Url.find_by_key!(params[:key])
      redirect_to url.long_url
    end
  end
end
