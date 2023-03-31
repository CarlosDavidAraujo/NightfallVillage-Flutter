import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/team/all_died_strategy.dart';
import 'package:nightfall_village_flutter/models/team/assassin_strategy.dart';
import 'package:nightfall_village_flutter/models/team/undead_strategy.dart';
import 'package:nightfall_village_flutter/models/team/villager_strategy.dart';
import 'package:nightfall_village_flutter/models/team/werewolf_strategy.dart';

class WinConditionManager {
  final Game game;
  late VillagersStrategy villagersStrategy;
  late WerewolvesStrategy werewolvesStrategy;
  late SolitaryWerewolfStrategy solitaryWerewolfStrategy;
  late UndeadsStrategy undeadsStrategy;
  late AssassinStrategy assassinStratagy;
  late AllDiedStrategy allDiedStrategy;
  late Map<String, Map<String, Function>> victoryConditions;

  WinConditionManager(this.game) {
    villagersStrategy = VillagersStrategy(game);
    werewolvesStrategy = WerewolvesStrategy(game);
    solitaryWerewolfStrategy = SolitaryWerewolfStrategy(game);
    undeadsStrategy = UndeadsStrategy(game);
    assassinStratagy = AssassinStrategy(game);
    allDiedStrategy = AllDiedStrategy(game);

    victoryConditions = {
      'villagers': {
        'winCondition': () => villagersStrategy.checkVictory(),
        'victoryMessage': () => villagersStrategy.getVictoryMessage()
      },
      'werewolves': {
        'winCondition': () => werewolvesStrategy.checkVictory(),
        'victoryMessage': () => werewolvesStrategy.getVictoryMessage()
      },
      'solitaryWerewolf': {
        'winCondition': () => solitaryWerewolfStrategy.checkVictory(),
        'victoryMessage': () => solitaryWerewolfStrategy.getVictoryMessage()
      },
      'undeads': {
        'winCondition': () => undeadsStrategy.checkVictory(),
        'victoryMessage': () => undeadsStrategy.getVictoryMessage()
      },
      'assassin': {
        'winCondition': () => assassinStratagy.checkVictory(),
        'victoryMessage': () => assassinStratagy.getVictoryMessage()
      },
      'allDied': {
        'winCondition': () => allDiedStrategy.checkVictory(),
        'victoryMessage': () => allDiedStrategy.getVictoryMessage()
      },
    };
  }

  String? getWinnerTeam() {
    for (var team in victoryConditions.keys) {
      var checkVictoryCondition = victoryConditions[team]!;
      if (checkVictoryCondition['winCondition']!()) {
        var victoryMessage = getVictoryMessage(team);
        game.messages.setMessage(victoryMessage);
        return team;
      }
    }
    return null;
  }

  String getVictoryMessage(String team) =>
      victoryConditions[team]!['victoryMessage']!();
}
