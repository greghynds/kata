class Diamond
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def self.for(letter, filler = '.')
        quadrant = Quadrant.new(letter, filler)
        top_right = quadrant.for(:top_right)
        top_left = quadrant.for(:top_left)
        bottom_right = quadrant.for(:bottom_right)
        bottom_left = quadrant.for(:bottom_left)
        top_row = join_horizontal(top_left, top_right)
        bottom_row = join_horizontal(bottom_left, bottom_right)
        
        join_vertical(top_row, bottom_row)
    end

    private

    def self.join_horizontal(left, right)
        left.each_with_index.map do |row, i|
            row[0, row.length - 1] + right[i]
        end
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
            when :top_left then top_left(@letter)
            when :bottom_right then bottom_right(@letter)
            when :bottom_left then bottom_left(@letter)
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
    
        def bottom_right(letter)
            top_right(letter).reverse
        end

        def top_left(letter)
            top_right(letter).map{ |x| x.reverse }
        end
    
        def bottom_left(letter)
            bottom_right(letter).map{ |x| x.reverse }
        end
    end
end