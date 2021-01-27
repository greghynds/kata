class DiamondQuadrant
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def self.for(letter)
        total_rows = LETTERS.index(letter) + 1
        rows = []

        total_rows.times.each_with_index do |i|
            l = LETTERS[i]
            row = dots(total_rows)
            row[i] = l
            rows.push(row)
        end

        rows
    end

    def self.dots(length)
        "".rjust(length, ".")
    end 
end