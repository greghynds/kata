'use strict';

function getScore(player1Points, player2Points) {
    if (player1Points === player2Points) {
        if (player1Points >= 3) {
            return "Deuce";
        } else {
            return scoreForPoints(player1Points) + "-All";
        }
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

const scoreAbovePointsRange = (player1Score, player2Score) => {
    const win = Math.abs(player1Score - player2Score) >= 2;
    const leader = (player1Score > player2Score ? "player1" : "player2");
    return (win ? "Win for " + leader : "Advantage " + leader);
}

module.exports = getScore;