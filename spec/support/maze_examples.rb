module MazeExamples

  # Cells representing maze 5by5:
  #
  #     _________ 
  #    | |   |   |
  #    | | | | | |
  #    | | | | | |
  #    | | | | | |
  #    |___|___|_|
  #
  def cells_grid_5by5
    [
      [
        MazeMagic::Maze::Edge.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::Edge.instance
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::Passage.instance,
        MazeMagic::Maze::VerticalWall.instance,
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::VerticalWall.instance,
      ]
    ]
  end

  # Cells representing maze 1by1:
  #
  #     _
  #    |_|
  #
  def cells_grid_1by1
    [
      [
        MazeMagic::Maze::Edge.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::Edge.instance
      ],
      [
        MazeMagic::Maze::VerticalWall.instance,
        MazeMagic::Maze::HorizontalWall.instance,
        MazeMagic::Maze::VerticalWall.instance
      ]
    ]
  end
end
