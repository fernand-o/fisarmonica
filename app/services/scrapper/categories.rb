module Scrapper
  class Categories < ApplicationService
    URL = "https://fisarmonica.online/repertorio-de-musicas/?instrument=acordeon"

    def call
      authenticated_agent = Login.call
      page = authenticated_agent.get(URL)
      categories = Parser::Categories.call(page)

      categories.each do |category|
        persist_category(category)
      end
    end

    private

    def persist_category(category)
      record = Category.find_or_initialize_by(name: category[:category])
      record[:link] = category[:link]
      record.save
    end
  end
end
