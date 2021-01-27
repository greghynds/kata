class Diamond
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def self.for(letter, filler = '.')
        quadrant = Quadrant.new(letter, filler)
        
        join_vertical(
            join_horizontal(quadrant.for(:top_left), quadrant.for(:top_right)),
            join_horizontal(quadrant.for(:bottom_left), quadrant.for(:bottom_right))
        )
    end

    private

    def self.join_horizontal(left, right)
        left.each_with_index.map{ |row, i| row[0, row.length - 1] + right[i] }
    end

    def self.join_vertical(top, bottom)
        top.take(top.length - 1) + bottom
    end


    class Quadrant

        def initialize(letter, filler)
            @letter = letter
            @filler = filler
        end
    
        def for(position)
            case position
            when :top_right then top_right(@letter)
            when :top_left then top_right(@letter).map{ |x| x.reverse }
            when :bottom_right then top_right(@letter).reverse
            when :bottom_left then top_right(@letter).map{ |x| x.reverse }.reverse
            end
        end
    
        def top_right(letter)
            total_rows = LETTERS.index(letter) + 1
            total_rows.times.each_with_index.map do |i|
                letter_for_row = LETTERS[i]
                row = "".rjust(total_rows, @filler)
                row[i] = letter_for_row
                row
            end
        end
    end
end