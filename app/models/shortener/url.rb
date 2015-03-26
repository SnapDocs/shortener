module Shortener
  class Url < ActiveRecord::Base
    before_create :generate_key

    validates :key, :long_url, presence: true

    def self.generate!(long_url, retries = 0)
      url = self.new
      url.long_url = long_url
      url.key      = SecureRandom.hex(5)
      url.save!
      "http://snpd.co/#{url.key}"
    rescue ActiveRecord::RecordNotUnique => e
      if retries < 5
        self.generate!(long_url, retries + 1)
      else
        raise e
      end
    end

    def generate_key
    end
  end
end
