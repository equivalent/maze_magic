module MazeMagic
  module MazeGenerator
    class RecursiveBacktracking
      class West
        include Singleton

        def direction_x
          -1
        end

        def  direction_y
          0
        end

        def oposite
          East.instance
        end

        def to_i
          8
        end
      end
    end
  end
end
