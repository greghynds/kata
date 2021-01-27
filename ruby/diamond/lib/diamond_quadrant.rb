class DiamondQuadrant
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def initialize(letter, filler)
        @letter = letter
        @filler = filler
    end

    def row(position)
        case position
        when :top_right then top_right(@letter)
        when :top_left then top_left(@letter)
        when :bottom_right then bottom_right(@letter)
        when :bottom_left then bottom_left(@letter)
        end
    end

    def top_right(letter)
        total_rows = LETTERS.index(letter) + 1
        total_rows.times.each_with_index.map do |i|
            letter_for_row = LETTERS[i]
            row = dots(total_rows)
            row[i] = letter_for_row
            row
        end
    end

    def top_left(letter)
        top_right(letter).map{ |x| x.reverse }
    end

    def bottom_right(letter)
        top_right(letter).reverse
    end

    def bottom_left(letter)
        bottom_right(letter).map{ |x| x.reverse }
    end

    def dots(length)
        "".rjust(length, @filler)
    end 
end