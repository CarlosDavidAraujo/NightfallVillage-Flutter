import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Necromancer extends Role {
  Necromancer(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Necromante",
            team: "Undeads",
            species: "Human",
            interactWithDeadPlayers: true,
            roleImg: 'assets/images/necromancer.png',
            objective:
                "Seu objetivo é agir em conjunto com o zumbi para infectar toda a aldeia. Vocês vencerão quando todos estiverem infectados.",
            skills: {
              1: Skill(
                name: "Perpetuar",
                description:
                    "Escolha um zumbi alvo, a vida dele é extendida por mais 1 turno. Isso nao previne dele ser morto na votação",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/deathClock.png',
              ),
              2: Skill(
                name: "Recompor",
                description:
                    "Uma vez por jogo você escolhe um jogador eliminado, ele volta ao jogo como um zumbi com habilidades próprias.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/deadHand.png',
              ),
            });

  Necromancer.info()
      : super.info(
            name: "Necromante",
            team: "Undeads",
            roleImg: 'assets/images/necromancer.png',
            objective:
                "Seu objetivo é agir em conjunto com o zumbi para infectar toda a aldeia. Vocês vencerão quando todos estiverem infectados.",
            skills: {
              1: Skill(
                name: "Perpetuar",
                description:
                    "Escolha um zumbi alvo, a vida dele é extendida por mais 1 turno. Isso nao previne dele ser morto na votação",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/deathClock.png',
              ),
              2: Skill(
                name: "Recompor",
                description:
                    "Uma vez por jogo você escolhe um jogador eliminado, ele volta ao jogo como um zumbi com habilidades próprias.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/deadHand.png',
              ),
            });

  void perpetuar(Player targetPlayer) {
    targetPlayer.dieAfterManyTurns(2);
  }

  void recompor(Player targetPlayer) {
    targetPlayer.resurrectAfterManyTurns(1);
    targetPlayer.transformInUndead();
    disableSkill(2, 1000);
  }

  @override
  bool skillHasInvalidTargetOn(Player targetPlayer, int skill) {
    return !targetPlayer.isUndead() && skill == 1;
  }

  @override
  bool isSkillDisabled(int skill) {
    if (skill == 1) {
      var hasZombiesToTarget =
          game!.alivePlayers.any((player) => player.isUndead());
      return super.isSkillDisabled(skill) || !hasZombiesToTarget;
    }
    if (skill == 2) {
      return super.isSkillDisabled(skill) || !canInteractWithDeadPlayers();
    }
    return super.isSkillDisabled(skill);
  }
}
