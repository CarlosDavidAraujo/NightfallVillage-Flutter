import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Assassin extends Role {
  Assassin(Game? game, Player? player)
      : super(
          game: game,
          player: player,
          name: 'Assassino em série',
          team: 'Solo',
          species: 'Human',
          interactWithDeadPlayers: false,
          roleImg: 'assets/images/assassin.png',
          objective:
              'Seu objetivo é eliminar todos os jogadores. Você vence se for o último jogador vivo.',
          skills: {
            1: Skill(
                name: 'Assassinato',
                description:
                    "Todo turno você escolhe um jogador para eliminar.",
                icon: 'assets/images/dagger.png',
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1),
            2: Skill(
                name: "Sequestro",
                description:
                    "Uma vez por jogo você pode sequestrar um jogador. Ele é impedido de usar habilidades por 2 turnos.",
                icon: 'assets/images/string.png',
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1)
          },
        );

  Assassin.info()
      : super.info(
          name: 'Assassino em série',
          team: 'Solo',
          roleImg: 'assets/images/assassin.png',
          objective:
              'Seu objetivo é eliminar todos os jogadores. Você vence se for o último jogador vivo.',
          skills: {
            1: Skill(
                name: 'Assassinato',
                description:
                    "Todo turno você escolhe um jogador para eliminar.",
                icon: 'assets/images/dagger.png',
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1),
            2: Skill(
                name: "Sequestro",
                description:
                    "Uma vez por jogo você pode sequestrar um jogador. Ele é impedido de usar habilidades por 2 turnos.",
                icon: 'assets/images/string.png',
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1)
          },
        );

  /// Elimina o jogador alvo depois de um turno.
  ///
  /// @param targetPlayer Jogador alvo que será eliminado.
  void assassinar(Player targetPlayer) {
    targetPlayer.dieAfterManyTurns(1);
  }

  /// Impede o jogador alvo de usar habilidades por dois turnos e desabilita a habilidade "Sequestro" permanentemente.
  ///
  /// @param targetPlayer Jogador alvo que será sequestrado.
  void sequestrar(Player targetPlayer) {
    targetPlayer.role.disableSkill(1, 2);
    targetPlayer.role.disableSkill(2, 2);
    disableSkill(2, 1000);
  }
}
