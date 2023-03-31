import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/team_strategy.dart';

class WerewolvesStrategy extends TeamStrategy {
  WerewolvesStrategy(Game game) : super(game);

  @override
  bool checkVictory() {
    var onlyWerewolvesAlive =
        game.alivePlayers.every((player) => player.belongsToWerewolvesTeam());
    var solitaryWerewolfStrategy = SolitaryWerewolfStrategy(game);
    var solitaryWerewolfWon = solitaryWerewolfStrategy.checkVictory();
    return onlyWerewolvesAlive && !solitaryWerewolfWon;
  }

  @override
  String getVictoryMessage() => "Os lobisomens venceram!";
}

class SolitaryWerewolfStrategy extends TeamStrategy {
  SolitaryWerewolfStrategy(Game game) : super(game);

  @override
  bool checkVictory() {
    var onePlayerAlive = game.alivePlayers.length == 1;
    var lastPlayerAlive = game.alivePlayers[0];
    return onePlayerAlive && lastPlayerAlive.isLonelyWolf();
  }

  @override
  String getVictoryMessage() {
    var lastPlayerName = game.alivePlayers[0].name;
    return '$lastPlayerName venceu!';
  }
}
