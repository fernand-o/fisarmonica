module Scrapper
  module Parser
    class Base < ApplicationService
      def initialize(nokogiri_page)
        @nokogiri_page = nokogiri_page
      end

      protected

      attr_reader :nokogiri_page
    end
  end
end
