module MazeMagic
  module MazeGenerator
    class RecursiveBacktracking
      class South
        include Singleton

        def direction_x
          0
        end

        def  direction_y
          1
        end

        def oposite
          North.instance
        end

        def to_i
          2
        end
      end
    end
  end
end
