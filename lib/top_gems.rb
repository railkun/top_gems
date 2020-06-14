require 'selenium-webdriver'
require 'nokogiri'
require 'capybara'
require 'pry'

require_relative 'top_gems/ruby_gems_session'
require_relative '../capybara_spec'
require_relative 'top_gems/gem'
require_relative 'top_gems/parse_page'
require_relative 'top_gems/exceptions/bad_email_or_password'

module TopGems
  def self.run(page_count: count)
    pages = pages_with_popular_gems(page_count)
    gems = parse_page.parse_page(pages)
    gems.map { |gem| Gem.new(gem) }
  end

  private

  def self.rubygems
    @rubygem ||= RubyGemsSession.new
  end

  def self.parse_page
    @parse_page ||= ParsePage.new
  end

  def self.pages_with_popular_gems(page_count)
    rubygems.go_to_rubygems
    rubygems.sing_in
    rubygems.go_to_popular_gems

    pages = []

    for page_number in 1..page_count
      rubygems.next_page(page_number.to_s) if page_number > 1
      pages << rubygems.get_pages
    end

    rubygems.end_session
    pages
  end
end
