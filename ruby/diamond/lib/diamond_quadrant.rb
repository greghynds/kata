class DiamondQuadrant
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ".split('')
    private_constant :LETTERS

    def self.for(letter)
        total_rows = LETTERS.index(letter) + 1
        rows = []
        total_rows.times do
            rows.push("".rjust(total_rows, "."))
        end
        rows
    end

    # ..A | A..
    # .B. | .B.
    # C.. | ..C
    # ---------
    # C.. | ..C
    # .B. | .B.
    # ..A | A..

end