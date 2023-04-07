require 'minitest/autorun'
require_relative 'minesweeper'

class MinesweeperTest < Minitest::Test
  def test_transform1
    inp = ['+------+',
           '| *  * |',
           '|  *   |',
           '|    * |',
           '|   * *|',
           '| *  * |',
           '|      |',
           '+------+']
    out = ['+------+',
           '|1*22*1|',
           '|12*322|',
           '| 123*2|',
           '|112*4*|',
           '|1*22*2|',
           '|111111|',
           '+------+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform2
    inp = ['+-----+', '| * * |', '|     |', '|   * |', '|  * *|',
           '| * * |', '+-----+']
    out = ['+-----+', '|1*2*1|', '|11322|', '| 12*2|', '|12*4*|',
           '|1*3*2|', '+-----+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform3
    inp = ['+-----+', '| * * |', '+-----+']
    out = ['+-----+', '|1*2*1|', '+-----+']
    assert_equal out, Board.transform(inp)
  end

  def test_transform4
    inp = ['+-+', '| |', '|*  |', '|  |', '+-+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end

  def test_faulty_border
    inp = ['+-----+', '*   * |', '+-- --+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end

  def test_invalid_char
    skip
    inp = ['+-----+', '|X  * |', '+-----+']
    assert_raises(ArgumentError) do
      Board.transform(inp)
    end
  end
end
