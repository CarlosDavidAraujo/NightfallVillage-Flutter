import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Doctor extends Role {
  Player? _lastHealedTarget;
  int _lastTurnOfHealUse = -1;

  Doctor(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Médica",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: true,
            roleImg: 'assets/images/doctor.png',
            objective: "Seu objetivo é proteger e manter os aldeões vivos.",
            skills: {
              1: Skill(
                name: "Curar",
                description:
                    "Impede um jogador de morrer esta noite. Não pode selecionar o mesmo alvo em turnos seguidos.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/medicine.png',
              ),
              2: Skill(
                name: "Reanimar",
                description:
                    "Uma vez por jogo ressuscite um jogador eliminado.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/syringe.png',
              ),
            });

  void curar(Player targetPlayer) {
    targetPlayer.setProtectedTurnsDuration(1);
    _lastHealedTarget = targetPlayer;
    _lastTurnOfHealUse = game!.currentTurn;
  }

  void reanimar(Player targetPlayer) {
    targetPlayer.resurrectAfterManyTurns(1);
    disableSkill(2, 1000);
  }

  @override
  bool skillHasInvalidTargetOn(Player targetPlayer, int chosenSkill) {
    var usingOnSameTarget = _lastHealedTarget == targetPlayer;
    var healWasUsedLastTurn = _lastTurnOfHealUse == game!.currentTurn - 1;
    return (usingOnSameTarget &&
            healWasUsedLastTurn &&
            chosenSkill == 1 //somente para a habilidade curar
        );
  }

  @override
  bool isSkillDisabled(int skill) {
    return (super.isSkillDisabled(skill) ||
        (!canInteractWithDeadPlayers() && skill == 2));
  }
}
