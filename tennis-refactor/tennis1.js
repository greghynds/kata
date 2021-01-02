'use strict';

function getScore(player1Points, player2Points) {
    if (player1Points === player2Points) {
        return scoreForEqualPoints(player1Points);
    } else if (player1Points >= 4 || player2Points >= 4) {
        return scoreAbovePointsRange(player1Points, player2Points);
    } else {
        return scoreForPoints(player1Points, player2Points);
    }
}

const scoreForPoints = (player1Points, player2Points) => {
    const player1Score = scoreForPlayer(player1Points);
    const player2Score = scoreForPlayer(player2Points);

    return player1Score + "-" + player2Score;
}

const scoreForPlayer = (score) => {
    switch (score) {
        case 0:
            return "Love";
        case 1:
            return "Fifteen";
        case 2:
            return "Thirty";
        case 3:
            return "Forty";
    }
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