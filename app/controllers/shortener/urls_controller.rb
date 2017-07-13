module Shortener
  class UrlsController < Shortener::ApplicationController
    def show
      if (url = Url.fetch_by_key(params[:key]).first)
        redirect_to url.long_url
      else
        redirect_to link_expired_url
      end
    end

    protected

    def link_expired_url
      if Rails.env.production?
        'https://app.snapdocs.com/link_expired'
      elsif Rails.env.staging?
        'https://app-sales.snapdocs.com/link_expired'
      elsif Rails.env.development? || Rails.env.test?
        'http://localhost:3000/link_expired'
      else
        raise StandardError('unknown environment')
      end
    end
  end
end
