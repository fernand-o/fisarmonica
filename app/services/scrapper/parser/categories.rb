module Scrapper
  module Parser
    class Categories < ApplicationService
      def initialize(nokogiri_page)
        @nokogiri_page = nokogiri_page
      end

      def call
        nokogiri_page.css('a.repertory').map do |element|
          category = element.css('span.card-title').text.squish
          link = element.attributes['href'].value

          { category: category, link: link}
        end
      end

      private

      attr_reader :nokogiri_page
    end
  end
end