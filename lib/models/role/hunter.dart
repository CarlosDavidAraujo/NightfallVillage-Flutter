import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Hunter extends Role {
  Hunter(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Caçador",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/hunter.png',
            objective:
                "Seu objetivo é eliminar os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Atirar",
                description:
                    "Uma vez por jogo você escolhe um jogador. Ele é eliminado.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/target.png',
              ),
              2: Skill(
                name: "Armadilha",
                description:
                    "Impede um jogador de usar habilidades na próxima rodada. Recarrega após dois turnos.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/trap.png',
              ),
            });

  Hunter.info()
      : super.info(
            name: "Caçador",
            team: "Aldeões",
            roleImg: 'assets/images/hunter.png',
            objective:
                "Seu objetivo é eliminar os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Atirar",
                description:
                    "Uma vez por jogo você escolhe um jogador. Ele é eliminado.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/target.png',
              ),
              2: Skill(
                name: "Armadilha",
                description:
                    "Impede um jogador de usar habilidades na próxima rodada. Recarrega após dois turnos.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/trap.png',
              ),
            });

  void atirar(Player targetPlayer) {
    targetPlayer.dieAfterManyTurns(1);
    disableSkill(1, 1000);
  }

  void capturar(Player targetPlayer) {
    targetPlayer.role.disableSkill(1, 1);
    targetPlayer.role.disableSkill(2, 1);
    disableSkill(2, 2);
  }
}
