import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Seer extends Role {
  Seer(Game game, Player player)
      : super(
            game: game,
            player: player,
            name: "Vidente",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: true,
            roleImg: 'assets/images/seer3.png',
            objective:
                "Seu objetivo é descobrir quem são os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Revelar",
                description: "Você pode ver a função de outro jogador.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/seerEye.png',
              ),
              2: Skill(
                name: "Contactar",
                description:
                    "Você pode ver a função de um jogador que ja morreu.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/tarot.png',
              ),
            });

  Seer.info()
      : super.info(
            name: "Vidente",
            team: "Aldeões",
            roleImg: 'assets/images/seer3.png',
            objective:
                "Seu objetivo é descobrir quem são os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Revelar",
                description: "Você pode ver a função de outro jogador.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/seerEye.png',
              ),
              2: Skill(
                name: "Contactar",
                description:
                    "Você pode ver a função de um jogador que ja morreu.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/tarot.png',
              ),
            });

  String revelar(Player targetPlayer) {
    var playerName = targetPlayer.name;
    var roleFakeName = player!.role.fakeName;
    return 'A verdade foi revelada! $playerName é $roleFakeName. Fique atento à sua jogada!';
  }

  String contactar(Player targetPlayer) {
    var playerName = targetPlayer.name;
    var roleName = player!.role.name;
    return 'A verdade foi revelada! $playerName era $roleName.';
  }

  @override
  bool isSkillDisabled(int skill) {
    return (super.isSkillDisabled(skill) ||
        (!canInteractWithDeadPlayers() && skill == 2));
  }
}
