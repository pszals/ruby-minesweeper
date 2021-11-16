=begin
Write your code for the 'Minesweeper' exercise in this file. Make the tests in
`minesweeper_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/minesweeper` directory.
=end
require 'pry'
class Board
  class << self
    def transform(rows)
      row_len = rows.first.length
      rows.each_with_index do |row, rix|
        raise ArgumentError.new('uneven board') if row.length != row_len
        raise ArgumentError.new('invalid chars') unless row.match? /^[\+\-\*\s\|]+$/

        chars = row.chars

        raise ArgumentError.new('faulty border') unless chars.first == chars.last

        max_ix = chars.count - 1
        context = row_slice(rows, rix)
        chars.each_with_index do |square, ix|
          next unless square == ' '
          splats = 0

          if ix == 0
            start = 0
            len = 2
          elsif ix == chars.count - 1
            start = ix - 1
            len = 2
          else
            start = ix - 1
            len =3
          end

          context.each do |row|
            splats += row.slice(start, len).chars.select {|c| c == '*'}.count
          end

          chars[ix] = splats if splats >= 1
        end

        rows[rix] = chars.join('')
      end

      rows
    end

    private

    def row_slice(rows, rix)
      if rix == 0
        rows.slice(0, 2)
      elsif rix == rows.count - 1
        rows.slice(rix - 1, 2)
      else
        rows.slice(rix -1, 3)
      end
    end
  end
end
