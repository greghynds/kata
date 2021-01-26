class Diamond
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
    private_constant :LETTERS

    def self.for(letter)
        total_rows = total_rows(letter)
        lines = []
        middle = (total_rows - 1) / 2
        top = middle.downto(0).map { |n| n }
        bottom = top.take(middle).reverse
        indices = top + bottom

        indices.each do |i|
            lines.push(self.generate_row(LETTERS[middle - i], total_rows, i))
        end

        lines
    end

    private

    def self.generate_row(letter, total_rows, from_middle) 
        row = "".rjust(total_rows, ".")
        row[from_middle] = letter
        row[row.length - (1 + from_middle)] = letter
        row
    end

    def self.total_rows(letter)
        numbers = LETTERS.split('').each_with_index.map{ |x, i| (i * 2) + 1 }
        total_rows = numbers[LETTERS.index(letter)]
    end
end