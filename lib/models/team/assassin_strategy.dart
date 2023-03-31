import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/team_strategy.dart';

class AssassinStrategy extends TeamStrategy {
  AssassinStrategy(Game game) : super(game);

  @override
  bool checkVictory() {
    var onePlayerAlive = game.alivePlayers.length == 1;
    var lastPlayerAlive = game.alivePlayers[0];
    return lastPlayerAlive.isAssassin() && onePlayerAlive;
  }

  @override
  String getVictoryMessage() {
    var playerName = game.alivePlayers[0].name;
    return '$playerName venceu!';
  }
}
