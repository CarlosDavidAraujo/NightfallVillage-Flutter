import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Gunslinger extends Role {
  int _charges = 2;

  Gunslinger(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Pistoleiro",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/gunslinger.png',
            objective:
                "Seu objetivo é eliminar os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Tome Bala!",
                description:
                    "Duas vezes por jogo escolha alguém para eliminar.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/revolver.png',
              ),
              2: Skill(
                name: "BANG",
                description:
                    "Passivo: seus tiros sâo muito barulhentos e sua função será revelada após o primeiro disparo.",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'assets/images/bang.png',
              )
            });

  Gunslinger.info()
      : super.info(
            name: "Pistoleiro",
            team: "Aldeões",
            roleImg: 'assets/images/gunslinger.png',
            objective:
                "Seu objetivo é eliminar os lobisomens e ajudar os aldeões a vencerem o jogo.",
            skills: {
              1: Skill(
                name: "Tome Bala!",
                description:
                    "Duas vezes por jogo escolha alguém para eliminar.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/revolver.png',
              ),
              2: Skill(
                name: "BANG",
                description:
                    "Passivo: seus tiros sâo muito barulhentos e sua função será revelada após o primeiro disparo.",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'assets/images/bang.png',
              )
            });

  void atirar(Player targetPlayer) {
    targetPlayer.dieAfterManyTurns(1);
    if (_charges == 2) {
      var playerName = player!.name;
      game!.messages.addMessage('$playerName é um pistoleiro.');
    }
    _charges--;
    if (_charges == 0) {
      disableSkill(1, 1000);
    }
  }
}
