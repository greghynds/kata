class Diamond
    NUMBERS = {'A' => 1, 'B' => 3, 'C' => 5, 'D' => 7 }
    LETTERS = ['A', 'B', 'C', 'D', 'E', 'F']
    # A = 1 + index(0) = 1
    # B = 1 + index(1) = 2 

    def self.for(letter)
        total_rows = NUMBERS[letter]
        
        middle = middle_row(letter, total_rows)
        top = first_row(letter, total_rows)
        rows = generate_square(total_rows)
        lines = []

        index_of_middle = (rows.length - 1) / 2

        index_of_middle.downto(0).each do |i| 
            line = self.next_row(LETTERS[index_of_middle - i], total_rows, i)
            lines.push(line)
        end

        (index_of_middle - 1).downto(0).each do |i| 
            lines.push(lines[i])
        end

        lines
    end

    def self.generate_square(number_of_rows)
        rows = []
        number_of_rows.times do
            rows.push("".rjust(number_of_rows, "."))
        end
        rows
    end

    def self.first_row(letter, total_rows) 
        first = "".rjust(total_rows, ".")
        index = (first.length - 1) / 2
        first[index] = 'A'
        first
    end

    def self.next_row(letter, total_rows, from_middle) 
        middle = "".rjust(total_rows, ".")
        middle[from_middle] = letter
        middle[middle.length - (1 + from_middle)] = letter
        middle
    end

    def self.middle_row(letter, total_rows)
        middle = "".rjust(total_rows, ".")
        middle[0] = letter
        middle[middle.length - 1] = letter
        middle
    end
end