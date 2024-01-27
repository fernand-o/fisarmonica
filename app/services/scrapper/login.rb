require 'mechanize'

module Scrapper
  class Login < ApplicationService
    URL = 'https://fisarmonica.online/wp-login.php'

    def call
      agent = Mechanize.new
      login_page = agent.get(URL)

      login_form = login_page.forms.first
      login_form['log'] = ENV['FISARMONICA_ONLINE_USERNAME']
      login_form['pwd'] = ENV['FISARMONICA_ONLINE_PASSWORD']

      logged_in_page = agent.submit(login_form)

      agent
    end
  end
end