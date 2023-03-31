import 'dart:math';

import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';
import 'package:nightfall_village_flutter/models/role/villager.dart';
import 'package:nightfall_village_flutter/models/role/werewolf.dart';

class Scientist extends Role {
  Map<String, Function> potionsEffects = {
    'pavor': (targetPlayer) => targetPlayer.setDisabledVoteDuration(1),
    'confusão': (targetPlayer) => targetPlayer.setConfused(true),
    'manipulação': (targetPlayer) => targetPlayer.setDuplicatedVote(true),
  };

  Scientist(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Cientista Maluco",
            team: "Aldeões",
            species: "Human",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/scientist.png',
            objective:
                "Seu objetivo é ajudar a erradicar os lobisomens, mas tudo que você faz é imprevisível.",
            skills: {
              1: Skill(
                name: "Experimento",
                description:
                    "Uma vez por jogo escolha um jogador. Se for um lobisomem, transforme-o em aldeão. Se for aldeão transforme-o em lobisomem.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/tube.png',
              ),
              2: Skill(
                name: "Alquimia",
                description:
                    'Crie 1 de 3 poções aleatórias (pavor, confusão ou manipulação), sem repetir a mesma poção a cada turno. Bloqueia "Alquimia" após 3 usos.',
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'assets/images/potion.png',
              ),
            });

  void experimentar(Player targetPlayer) {
    if (targetPlayer.belongsToVillagersTeam()) {
      var werewolf = Werewolf(game, targetPlayer);
      targetPlayer.role = werewolf;
    } else if (targetPlayer.isWolf()) {
      var villager = Villager(game, targetPlayer);
      targetPlayer.role = villager;
    }
    disableSkill(1, 1000);
  }

  void usarPocao(Player targetPlayer, String potion) {
    if (!potionsEffects.containsKey(potion)) {
      throw Exception(
          'Parâmetro inválido: $potion. Valores aceitos: "pavor", "confusão", "manipulação"');
    }
    var usePotionEffectOn = potionsEffects[potion];
    usePotionEffectOn!(targetPlayer);
    potionsEffects.remove(potion);
    if (!_hasPotions()) {
      return disableSkill(2, 1000);
    }
  }

  Function? gerarPocao() {
    var potions = potionsEffects.keys;
    var randomIndex = Random().nextInt(potions.length);
    var potion = potionsEffects[randomIndex];
    return potion;
  }

  bool _hasPotions() {
    return potionsEffects.keys.isNotEmpty;
  }
}
