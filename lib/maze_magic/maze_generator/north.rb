module MazeMagic
  module MazeGenerator
    class North
      include Singleton

      def direction_x
        0
      end

      def  direction_y
        -1
      end

      def oposite
        South.instance
      end

      def to_i
        1
      end
    end
  end
end
