module Shortener
  class UrlsController < ApplicationController
    def show
      url = Url.find_by_key!(params[:key])
      redirect_to url.long_url
    end
  end
end
