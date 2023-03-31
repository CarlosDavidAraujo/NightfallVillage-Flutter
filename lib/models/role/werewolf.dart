import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Werewolf extends Role {
  Werewolf(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Lobisomem",
            team: "Lobisomens",
            species: "Wolf",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/werewolf.png',
            objective:
                "Seu objetivo é eliminar todos os aldeões. Haja como se fosse um aldeão.",
            skills: {
              1: Skill(
                name: "Devorar",
                description:
                    "Você e outros lobisomens votam em um jogador para elimina-lo do jogo. Em caso de empate, a vítima é aleatória.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/bite.png',
              ),
              2: Skill(
                name: "Transmutar",
                description:
                    "Os outros aldeões te verão como aldeão neste e no próximo turno. Bloqueia devorar enquanto transmutado.",
                targetType: false,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/transmute.png',
              ),
            });

  void devorar(Player targetPlayer) {
    player!.voteOn(targetPlayer);
  }

  void transmutar() {
    setFakeName("Aldeão", 1);
    disableSkill(1, 1);
  }

  @override
  bool skillHasInvalidTargetOn(Player targetPlayer, int skill) {
    return targetPlayer.isWolf();
  }
}

class LonelyWerewolf extends Werewolf {
  LonelyWerewolf(Game? game, Player? player) : super(game, player) {
    name = "Lobisomem Solitário";
    objective =
        "Seu objeitvo é eliminar todos os aldeões, mas você só vencerá se for o último lobisomem vivo.";
    roleImg = 'loneWolfImg';
  }
}
