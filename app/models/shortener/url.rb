module Shortener
  class Url < ActiveRecord::Base
    validates :key, :long_url, presence: true

    scope :fetch_by_key, -> (key) { where(key: key).where('created_at >= ?', 14.days.ago) }

    def self.shorten(long_url, retries = 0)
      url = self.new
      url.long_url = long_url
      url.key      = [*'A'..'Z', *'a'..'z', *0..9].sample(6).join
      url.save!

      if Rails.env.production?
        "http://snpd.co/#{url.key}"
      elsif Rails.env.staging?
        "http://s.snpd.co/#{url.key}"
      elsif Rails.env.development?
        "http://d.snpd.co/#{url.key}"
      else
        "http://t.snpd.co/#{url.key}"
      end

    rescue ActiveRecord::RecordNotUnique => e
      if retries < 5
        self.shorten(long_url, retries + 1)
      else
        raise e
      end
    end
  end
end
