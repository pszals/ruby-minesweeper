=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.
To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

class Board
  def self.transform(input)
      copy = input
      copy.each_with_index do |row, row_index|
        row.each_char.with_index do |char, column_index|
          if char == " "
            mine_count = 0

            mine_count += 1 if mine_left?(row, column_index)
            mine_count += 1 if mine_top_left?(copy, row_index, column_index)
            mine_count += 1 if mine_up?(copy, row_index, column_index)
            mine_count += 1 if mine_top_right?(copy, row_index, column_index)
            mine_count += 1 if mine_right?(row, column_index)
            mine_count += 1 if mine_bottom_right?(copy, row_index, column_index)
            mine_count += 1 if mine_down?(copy, row_index, column_index)
            mine_count += 1 if mine_bottom_left?(copy, row_index, column_index)
            if mine_count > 0
              copy[row_index][column_index] = mine_count.to_s
            end
          end
        end
      end
      copy
  end

  def self.mine_left?(row, current_index)
    row[current_index - 1] == "*"
  end

  def self.mine_top_left?(input, row_index, column_index)
    input[row_index - 1][column_index - 1] == "*"
  end

  def self.mine_up?(input, row_index, column_index)
    input[row_index - 1][column_index] == "*"
  end

  def self.mine_top_right?(input, row_index, column_index)
    input[row_index - 1][column_index + 1] == "*"
  end

  def self.mine_right?(row, current_index)
    row[current_index + 1] == "*"
  end

  def self.mine_bottom_right?(input, row_index, column_index)
    input[row_index + 1][column_index + 1] == "*"
  end

  def self.mine_down?(input, row_index, column_index)
    input[row_index + 1][column_index] == "*"
  end

  def self.mine_bottom_left?(input, row_index, column_index)
    input[row_index + 1][column_index - 1] == "*"
  end
end
