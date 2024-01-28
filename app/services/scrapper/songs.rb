module Scrapper
  class Songs < ApplicationService
    def call
      authenticated_agent = Login.call
      
      Category.all.each do |category|
        page = authenticated_agent.get(category[:link])
        songs = Parser::Songs.call(page)

        persist_songs(songs, category)
      end
    end

    private

    attr_reader :authenticated_agent, :category_url

    def persist_songs(songs, category)
      songs.each do |song|
        record = Song.find_or_initialize_by(title: song[:title])
        record[:category_id] = category[:id]
        record[:link] = song[:link]
        record.save
      end
    end
  end
end
