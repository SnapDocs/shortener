module Shortener
  class ApplicationController < ActionController::Base
    def home
      redirect_to 'http://snapdocs.com'
    end
  end
end
