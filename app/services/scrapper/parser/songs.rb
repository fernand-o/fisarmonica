module Scrapper
  module Parser
    class Songs < Base
      def call
        nokogiri_page.css('li.song').map do |element|
          title = element.css('span.song-title').text.squish
          link = element.css('a.play-button').first.attributes['href'].value

          { title: title, link: link}
        end
      end
    end
  end
end