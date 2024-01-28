module Scrapper
  module Parser
    class Categories < Base
      def call
        nokogiri_page.css('a.repertory').map do |element|
          category = element.css('span.card-title').text.squish
          link = element.attributes['href'].value

          { category: category, link: link}
        end
      end
    end
  end
end