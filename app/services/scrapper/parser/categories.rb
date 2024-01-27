module Scrapper
  module Parser
    class Categories < ApplicationService
      def initialize(html)
        @html = html
      end

      def call
        page = Nokogiri::HTML(html)
        page.css('a.repertory').map do |element|
          category = element.css('span.card-title').text.squish
          link = element.attributes['href'].value

          { category: category, link: link}
        end
      end

      private

      attr_reader :html
    end
  end
end