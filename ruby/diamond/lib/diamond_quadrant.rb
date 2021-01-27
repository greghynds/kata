class DiamondQuadrant
    LETTERS = "ABCDEFGHIJKLMNOPQRSTUVXYZ"
    private_constant :LETTERS

    def self.for(letter)
        total_rows = LETTERS.split('').index(letter) + 1
        rows = []
        total_rows.times do
            rows.push(".")
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