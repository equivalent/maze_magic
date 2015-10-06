module MazeMagic
  module MazeGenerator
    def self.default_preseeder
      ->{ srand(MazeMagic::MazeGenerator.default_randomizer.call(0xFFFF_FFFF).to_i) }
    end

    def self.default_randomizer
      ->(*args){ rand(*args) }
    end
  end
end
