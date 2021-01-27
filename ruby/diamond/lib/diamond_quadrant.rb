class DiamondQuadrant
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def self.for(letter)
        total_rows = LETTERS.index(letter) + 1
        total_rows.times.each_with_index.map do |i|
            l = LETTERS[i]
            row = dots(total_rows)
            row[i] = l
            row
        end
    end

    def self.dots(length)
        "".rjust(length, ".")
    end 
end