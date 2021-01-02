'use strict';

function getScore(player1Score, player2Score) {
    var score = "";
    var tempScore = 0;

    if (player1Score === player2Score) {
        return scoreForEqualPoints(player1Score);
    } else if (player1Score >= 4 || player2Score >= 4) {
        var minusResult = player1Score - player2Score;
        if (minusResult === 1) {score = "Advantage player1";}
        else if (minusResult === -1) {score = "Advantage player2";}
        else if (minusResult >= 2) {score = "Win for player1";}
        else {score = "Win for player2";}
    } else {
        for (var i = 1; i < 3; i++) {
            if (i === 1) {tempScore = player1Score;}
            else {
                score += "-";
                tempScore = player2Score;
            }
            switch (tempScore) {
                case 0:
                    score += "Love";
                    break;
                case 1:
                    score += "Fifteen";
                    break;
                case 2:
                    score += "Thirty";
                    break;
                case 3:
                    score += "Forty";
                    break;
            }
        }
    }
    return score;
}

const scoreForEqualPoints = (score) => {
    switch (score) {
        case 0:
            return "Love-All";
        case 1:
            return "Fifteen-All";
        case 2:
            return "Thirty-All";
        default:
            return "Deuce";
    }
}

module.exports = getScore;