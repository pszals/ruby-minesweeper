class Board
  MINE = "*"
  BORDER_CORNER = "+"
  BORDER_SIDE = "|"
  BORDER_TOP_BOTTOM = "-"
  EMPTY_SPACE = " "

  def self.transform(input)
    validate_input(input)
    input.each_with_index do |row, row_index|
      row.each_char.with_index do |char, column_index|
        if char == EMPTY_SPACE
          mine_count = 0

          mine_count += 1 if mine_left?(row, column_index)
          mine_count += 1 if mine_top_left?(input, row_index, column_index)
          mine_count += 1 if mine_up?(input, row_index, column_index)
          mine_count += 1 if mine_top_right?(input, row_index, column_index)
          mine_count += 1 if mine_right?(row, column_index)
          mine_count += 1 if mine_bottom_right?(input, row_index, column_index)
          mine_count += 1 if mine_down?(input, row_index, column_index)
          mine_count += 1 if mine_bottom_left?(input, row_index, column_index)
          if mine_count > 0
            input[row_index][column_index] = mine_count.to_s
          end
        end
      end
    end
    input
  end

  def self.validate_input(input)
    validate_input_length(input)
    validate_border(input)
    validate_characters(input)
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
      raise ArgumentError unless (char == BORDER_CORNER || char == BORDER_TOP_BOTTOM)
    end
    input[-1].each_char do |char|
      raise ArgumentError unless (char == BORDER_CORNER || char == BORDER_TOP_BOTTOM)
    end
    input.each do |row|
      raise ArgumentError unless (row[0] == BORDER_CORNER || row[0] == BORDER_SIDE)
      raise ArgumentError unless (row[-1] == BORDER_CORNER || row[-1] == BORDER_SIDE)
    end
  end

  def self.validate_input_length(input)
    width = input[0].length
    input.each do |row|
      raise ArgumentError if row.length != width
    end
  end

  def self.mine_left?(row, current_index)
    row[current_index - 1] == MINE
  end

  def self.mine_top_left?(input, row_index, column_index)
    input[row_index - 1][column_index - 1] == MINE
  end

  def self.mine_up?(input, row_index, column_index)
    input[row_index - 1][column_index] == MINE
  end

  def self.mine_top_right?(input, row_index, column_index)
    input[row_index - 1][column_index + 1] == MINE
  end

  def self.mine_right?(row, current_index)
    row[current_index + 1] == MINE
  end

  def self.mine_bottom_right?(input, row_index, column_index)
    input[row_index + 1][column_index + 1] == MINE
  end

  def self.mine_down?(input, row_index, column_index)
    input[row_index + 1][column_index] == MINE
  end

  def self.mine_bottom_left?(input, row_index, column_index)
    input[row_index + 1][column_index - 1] == MINE
  end
end
