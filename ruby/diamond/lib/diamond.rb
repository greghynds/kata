class Diamond
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
    private_constant :LETTERS

    def self.for(letter)
        total_rows = total_rows(letter)
        middle = calculate_middle(total_rows)
        indices = indices(middle)

        indices.map do |i|
            self.generate_row(LETTERS[middle - i], total_rows, i)
        end
    end

    private

    def self.generate_row(letter, total_rows, distance_from_middle) 
        row = empty_row(total_rows)
        row[distance_from_middle] = letter
        row[row.length - (1 + distance_from_middle)] = letter
        row
    end

    def self.indices(middle)
        top = middle.downto(0).map { |n| n }
        bottom = top.take(middle).reverse
        top + bottom
    end

    def self.calculate_middle(total_rows)
        (total_rows - 1) / 2
    end

    def self.total_rows(letter)
        numbers = LETTERS.split('').each_with_index.map{ |x, i| (i * 2) + 1 }
        total_rows = numbers[LETTERS.index(letter)]
    end

    def self.empty_row(length)
        "".rjust(length, ".")
    end 
end