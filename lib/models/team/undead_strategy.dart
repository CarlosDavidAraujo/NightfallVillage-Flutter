import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/team_strategy.dart';

class UndeadsStrategy extends TeamStrategy {
  UndeadsStrategy(Game game) : super(game);

  @override
  bool checkVictory() {
    var atLeastOneUndeadAlive =
        game.alivePlayers.any((player) => player.belongsToUndeadsTeam());
    var everyPlayerIsInfected = game.alivePlayers.every(
        (player) => player.isInfected() || player.belongsToUndeadsTeam());
    return everyPlayerIsInfected && atLeastOneUndeadAlive;
  }

  @override
  String getVictoryMessage() => 'Os mortos-vivos venceram!';
}
