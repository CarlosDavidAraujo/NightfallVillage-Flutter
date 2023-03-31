import 'dart:math';

import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Witch extends Role {
  Player? _lastCursedTarget;
  int _lastTurnOfCurseUse = -1;

  Witch(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Feiticeira",
            team: "Lobisomens",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/witch.png',
            objective:
                "Seu objetivo é descobrir quem são os videntes e atrapalhar os aldeões para que os lobisomens vençam.",
            skills: {
              1: Skill(
                name: "Maldição",
                description:
                    "Você bloqueia uma habilidade aleatória de um jogador por 1 turno. Não pode selecionar o mesmo alvo em turnos seguidos.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/darkPotion.png',
              ),
              2: Skill(
                name: "Premonição",
                description:
                    "Selecione um jogador para ver se ele é lobisomem ou vidente",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/crystalBall.png',
              ),
            });

  void amaldicoar(Player targetPlayer) {
    var randomSkill = Random().nextInt(2) + 1;
    targetPlayer.role.disableSkill(randomSkill, 1);
    _lastCursedTarget = targetPlayer;
    _lastTurnOfCurseUse = game!.currentTurn;
  }

  String prever(Player targetPlayer) {
    var isSeer = targetPlayer.role.name == "Vidente";
    var isWerewolf = targetPlayer.isWolf();
    var playerName = targetPlayer.name;
    if (isSeer) {
      return 'A visão é clara! $playerName é um vidente.';
    }
    if (isWerewolf) {
      return 'A visão é clara! $playerName é um lobisomem.';
    }
    return '$playerName não é vidente nem lobisomem.';
  }

  @override
  bool skillHasInvalidTargetOn(Player targetPlayer, int chosenSkill) {
    var usingOnSameTarget = _lastCursedTarget == targetPlayer;
    var curseWasUsedLastTurn = _lastTurnOfCurseUse == game!.currentTurn - 1;
    return (usingOnSameTarget &&
            curseWasUsedLastTurn &&
            chosenSkill == 1 //somente para a habilidade amaldiçoar
        );
  }
}
