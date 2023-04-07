=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.
To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

class Board
  def self.transform(input)
      validate_input_length(input)
      validate_border(input)
      validate_characters(input)
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

  def self.validate_characters(input)
    input.each do |row|
      row.each_char do |char|
        raise ArgumentError if !!(char =~ /\w/)
      end
    end
  end

  def self.validate_border(input)
    input[0].each_char do |char|
      raise ArgumentError unless (char == "+" || char == "-")
    end
    input[-1].each_char do |char|
      raise ArgumentError unless (char == "+" || char == "-")
    end
    input.each do |row|
      raise ArgumentError unless (row[0] == "+" || row[0] == "|")
      raise ArgumentError unless (row[-1] == "+" || row[-1] == "|")
    end
  end

  def self.validate_input_length(input)
    width = input[0].length
    input.each do |row|
      raise ArgumentError if row.length != width
    end
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
