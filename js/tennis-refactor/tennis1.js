'use strict';

const getScore = (player1Points, player2Points) => {
    const scoring = {
        0: "Love",
        1: "Fifteen",
        2: "Thirty",
        3: "Forty"
    };

    const isEqualScore = player1Points === player2Points;
    const isDeuce = isEqualScore && player1Points > 2;
    const isScoreAboveForty = player1Points > 3 || player2Points > 3
    const pointsDelta = Math.abs(player1Points - player2Points);
    const isAdvantagePoint = isScoreAboveForty && pointsDelta == 1;
    const isGamePoint = isScoreAboveForty && pointsDelta >= 2;

    if (isDeuce) {
        return "Deuce";
    } else if (isEqualScore) {
        return `${scoring[player1Points]}-All`;
    } else if (isAdvantagePoint || isGamePoint) {
        const leader = (player1Points > player2Points ? "player1" : "player2");
        return (isAdvantagePoint ? `Advantage ${leader}` : `Win for ${leader}`);
    } else {
        return `${scoring[player1Points]}-${scoring[player2Points]}`;
    }
}


module.exports = getScore;