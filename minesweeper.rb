=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.
To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end

class Board
  def self.transform(input)
    ["+------+", "|1*22*1|", "|12*322|", "| 123*2|", "|112*4*|", "|1*22*2|", "|111111|", "+------+"]

    # Plan:
    # For each square, check each neighboring square for mines.
    #   Go through each row
    #   If a mine is found, increment counter
    #   if blank string " "
    #     check left
    #       [current index -1][current row]
    #       If a mine is found, increment counter
    #     check up
    #       [current index][current row -1]
    #       If a mine is found, increment counter
    #     check right
    #       [current index +1][current row]
    #       If a mine is found, increment counter
    #     check down
    #       [current index][current row +1]
    #       If a mine is found, increment counter
    #   Return modified board

  end
end
