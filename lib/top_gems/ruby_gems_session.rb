module TopGems
  class RubyGemsSession
    def go_to_rubygems
      @browser = Capybara.current_session
      @browser.visit 'https://rubygems.org/'
    end

    def sing_in
      @browser.click_link('Sign in')
      @browser.fill_in 'session[who]', with: ENV['USER_NAME']
      @browser.fill_in 'session[password]', with: ENV['USER_PASSWORD']
      @browser.click_button('commit')
      raise BadEmailOrPassword, "Bad Email or Password" unless @browser.has_no_text?('Bad email or password.')
    end

    def go_to_popular_gems
      @browser.click_link('Releases')
      @browser.click_link('Popular Gems')
    end

    def next_page(page_number)
      @browser.click_link(page_number)
    end

    def get_pages
      @browser.body
    end

    def end_session
      @browser.quit
    end
  end
end
