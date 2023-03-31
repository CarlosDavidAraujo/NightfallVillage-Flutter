import 'dart:math';

import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class ToughGuy extends Role {
  ToughGuy(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Valentão",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/toughGuy.png',
            objective:
                "Seu objetivo é eliminar os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Provocar",
                description:
                    "Uma vez por jogo você provoca os lobisomens forçando-os a te matarem. Há 20% de chance de um deles morrer com você.",
                targetType: false,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/roar.png',
              ),
              2: Skill(
                name: "Parrudo",
                description:
                    "Passivo: Quando você for atacado por lobisomens, você sobreviverá até o próximo dia.",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'assets/images/muscle.png',
              ),
            });

  void provocar() {
    player!.taunt = true;
    disableSkill(1, 1000);
    _killRandomWerewolf();
  }

  void _killRandomWerewolf() {
    var werewolf = game!.alivePlayers.firstWhere((player) => player.isWolf());
    var deathNumber = Random().nextDouble();
    var deathChance = 0.2;
    if (werewolf != null && deathNumber <= deathChance) {
      werewolf.dieAfterManyTurns(1);
    }
  }
}
