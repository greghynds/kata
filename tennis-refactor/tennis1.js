'use strict';

function getScore(player1Score, player2Score) {
    var score = "";
    var tempScore = 0;

    if (player1Score === player2Score) {
        return scoreForEqualPoints(player1Score);
    } else if (player1Score >= 4 || player2Score >= 4) {
        return scoreAbovePointsRange(player1Score, player2Score);
    } else {
        for (var i = 1; i < 3; i++) {
            if (i === 1) { tempScore = player1Score; }
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

const scoreAbovePointsRange = (player1Score, player2Score) => {
    var minusResult = player1Score - player2Score;

    if (minusResult === 1) {
        return "Advantage player1";
    }
    else if (minusResult === -1) {
        return "Advantage player2";
    }
    else if (minusResult >= 2) {
        return "Win for player1";
    }
    else {
        return "Win for player2";
    }
}

module.exports = getScore;