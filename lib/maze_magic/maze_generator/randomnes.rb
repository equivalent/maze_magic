module MazeMagic
  module MazeGenerator
    module Randomnes
      def self.included(base)
        base.send(:attr_writer, :preseeder, :randomizer)
      end

      def preseeder
        @preseeder ||= MazeMagic::MazeGenerator.default_preseeder
      end

      def randomizer
        @randomizer ||= MazeMagic::MazeGenerator.default_randomizer
      end
    end
  end
end
