module TopGems
  class ParsePage
    def parse_page(pages)
      gems= []

      pages.map do |page|
        doc = Nokogiri::HTML(page)
        gems_parsed = doc.xpath("//a[@class='gems__gem']")

        gems << gems_parsed.map do |gem|
          title = title(gem)
          download = download(gem)
          { title => download }
        end
      end
      gems.flatten
    end

    private

    def title(gem)
      gem.css("h2").children.first.text.delete(" \n")
    end

    def download(gem)
      gem.css("p").children[1].text.delete(" \n")
    end
  end
end
