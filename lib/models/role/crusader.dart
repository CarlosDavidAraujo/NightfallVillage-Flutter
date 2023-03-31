import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Crusader extends Role {
  Crusader(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Cruzado",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/crusader.png',
            objective:
                "Seu objeitvo é proteger os aldeões e descobrir os lobisomens.",
            skills: {
              1: Skill(
                  name: "Sacrifício",
                  description:
                      "Escolha um jogador. Se ele morreria esta noite você morre no lugar dele.",
                  targetType: true,
                  enableTurn: -1,
                  turnItWasDisabled: -1,
                  icon: 'assets/images/shield.png'),
              2: Skill(
                  name: "Julgamento",
                  description:
                      "Escolha um jogador. Se for um lobisomem, ele será exposto e julgamento é bloqueado permanentemente, se for um aldeão, julgamento e seus votos são bloqueados por 2 rodadas.",
                  targetType: true,
                  enableTurn: -1,
                  turnItWasDisabled: -1,
                  icon: 'assets/images/balance.png')
            });

  void sacrificar(Player targetPlayer) {
    targetPlayer.protector = player;
  }

  void julgar(Player targetPlayer) {
    if (targetPlayer.belongsToWerewolvesTeam()) {
      game!.messages
          .addMessage('${targetPlayer.name} é um lobisomem entre nós!');
      disableSkill(2, 1000);
    } else {
      disableSkill(2, 2);
      player!.setDisabledVoteDuration(2);
    }
  }
}
