import 'dart:math';

import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Villager extends Role {
  Villager(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Aldeão",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/villager.png',
            objective:
                "Seu objetivo é descobrir quem são os lobisomens e tentar proteger seus aliados.",
            skills: {
              1: Skill(
                name: "Espiar",
                description:
                    "Você tem 5% de chance de descobrir um lobisomem. Se conseguir, há 15% de chance dele te matar.",
                targetType: false,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/keyhole.png',
              ),
              2: Skill(
                name: "Rezar",
                description:
                    "Escolha outro jogador. Ele tem 5% de chance de ser protegido.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/pray.png',
              ),
            });

  String espiar() {
    var alivePlayers = game!.alivePlayers;
    const deathChance = 0.15;
    const discoverWerewolfChance = 0.05;
    var randomNumber = Random().nextDouble();
    var alert = "";
    var discoveredWereWolf = alivePlayers
        .firstWhere((player) => player.role.fakeName == "Lobisomem");
    if (randomNumber <= discoverWerewolfChance) {
      var deathNumber = Random().nextDouble();
      if (deathNumber <= deathChance) {
        player!.dieAfterManyTurns(1);
      } else if (discoveredWereWolf != null) {
        var werewolfName = discoveredWereWolf.name;
        alert = '$werewolfName é um lobisomem entre nós!';
      }
    }
    return alert;
  }

  void orar(Player targetPlayer) {
    const protectingChance = 0.05;
    var randomNumber = Random().nextDouble();
    if (randomNumber <= protectingChance) {
      targetPlayer.setProtectedTurnsDuration(1);
    }
  }
}

class OldMan extends Villager {
  OldMan(Game? game, Player? player) : super(game, player) {
    name = "Velho Caduco";
    objective =
        "Você é um aldeão comum, mas sempre que usar uma habilidade ela será bloqueada por 2 turnos.";
    roleImg = 'assets/images/oldMan.png';
  }

  @override
  String espiar() {
    disableSkill(1, 2);
    return super.espiar();
  }

  @override
  void orar(Player targetPlayer) {
    super.orar(targetPlayer);
    disableSkill(2, 2);
  }
}
