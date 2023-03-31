import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/team_strategy.dart';

class VillagersStrategy extends TeamStrategy {
  VillagersStrategy(Game game) : super(game);

  @override
  bool checkVictory() {
    var allEnemysDead = !game.alivePlayers
        .any((player) => player.isWolf() || player.isAssassin());
    var villagersStillAlive =
        game.alivePlayers.any((player) => player.belongsToVillagersTeam());
    return allEnemysDead && villagersStillAlive;
  }

  @override
  String getVictoryMessage() => 'Os aldeões venceram';
}
