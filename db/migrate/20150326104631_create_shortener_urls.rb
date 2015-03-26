class CreateShortenerUrls < ActiveRecord::Migration
  def change
    create_table :shortener_urls do |t|
      t.string :key,      null: false
      t.text   :long_url, null: false
      t.timestamps
    end

    add_index :shortener_urls, :key, unique: true
  end
end
