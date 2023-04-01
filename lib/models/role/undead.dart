import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class Undead extends Role {
  Undead(Game? game, Player? player)
      : super(
            game: game,
            player: player,
            name: "Zumbi",
            team: "Undeads",
            species: "Undead",
            interactWithDeadPlayers: false,
            roleImg: 'assets/images/zombie.png',
            objective:
                "Seu objetivo é infectar o máximo de pessoas e agir em conjunto com o necromante. Quando todos estiverem infectados vocês vencem.",
            skills: {
              1: Skill(
                name: "Mordida",
                description:
                    "Morde um jogador infectando-o pelo restante da partida.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'firstSkillIcon',
              ),
              2: Skill(
                name: "Pútrido",
                description:
                    "Passivo: Sua vida só dura um turno, apenas o necromante pode prolongá-la. Você nâo pode votar nem ser morto durante a noite, .",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'secondSkillIcon',
              ),
            });

  Undead.info()
      : super.info(
            name: "Zumbi",
            team: "Undeads",
            roleImg: 'assets/images/zombie.png',
            objective:
                "Seu objetivo é infectar o máximo de pessoas e agir em conjunto com o necromante. Quando todos estiverem infectados vocês vencem.",
            skills: {
              1: Skill(
                name: "Mordida",
                description:
                    "Morde um jogador infectando-o pelo restante da partida.",
                targetType: true,
                enableTurn: -1,
                turnItWasDisabled: -1,
                icon: 'firstSkillIcon',
              ),
              2: Skill(
                name: "Pútrido",
                description:
                    "Passivo: Sua vida só dura um turno, apenas o necromante pode prolongá-la. Você nâo pode votar nem ser morto durante a noite, .",
                targetType: false,
                enableTurn: 1000,
                turnItWasDisabled: -1,
                icon: 'secondSkillIcon',
              ),
            });

  void morder(Player targetPlayer) {
    targetPlayer.infected = true;
  }
}
