module MazeMagic
  module MazeGenerator
    class RecursiveBacktracking
      class East
        include Singleton

        def direction_x
          1
        end

        def  direction_y
          0
        end

        def oposite
          West.instance
        end

        def to_i
          4
        end
      end
    end
  end
end
