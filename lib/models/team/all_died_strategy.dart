import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/team_strategy.dart';

class AllDiedStrategy extends TeamStrategy {
  AllDiedStrategy(Game game) : super(game);

  @override
  bool checkVictory() => game.alivePlayers.isEmpty;

  @override
  String getVictoryMessage() => 'Todos morreram!';
}
