module TopGems
  class Gem
    attr_reader :title, :download

    def initialize(gem)
      @title = gem.keys.first
      @download = gem[gem.keys.first]
    end
  end
end
