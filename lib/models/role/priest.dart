import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Priest extends Role {
  Priest(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Padre",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/priest.png',
            objective:
                "Seu objetivo é ajudar os aldeões a eliminarem os lobisomens.",
            skills: {
              1: Skill(
                name: "Exorcismo",
                description:
                    "Uma vez por jogo você escolhe um jogador. Se for um lobisomem ele é eliminado, se for um aldeão você é eliminado.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/cross.png',
              ),
              2: Skill(
                name: "Iluminado",
                description:
                    "Passivo: A primeira vez que os lobisomens tentarem te matar você sobreviverá.",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'assets/images/sun.png',
              ),
            });

  void exorcizar(Player targetPlayer) {
    disableSkill(1, 1000);
    if (targetPlayer.isWolf()) {
      return targetPlayer.dieAfterManyTurns(1);
    }
    if (targetPlayer.belongsToVillagersTeam()) {
      return player!.dieAfterManyTurns(1);
    }
  }
}
