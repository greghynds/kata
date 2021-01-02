'use strict';

function getScore(player1Points, player2Points) {
    if (player1Points === player2Points) {
        return scoreForEqualPoints(player1Points);
    } else if (player1Points >= 4 || player2Points >= 4) {
        return scoreAbovePointsRange(player1Points, player2Points);
    } else {
        return scoreForPoints(player1Points) + "-" + scoreForPoints(player2Points);
    }
}

const scoreForPoints = (score) => {
    return {
        0: "Love",
        1: "Fifteen",
        2: "Thirty",
        3: "Forty"
    }[score];
}

const scoreForEqualPoints = (score) => {
    if (score >= 3) {
        return "Deuce";
    } else {
        return scoreForPoints(score) + "-All";
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