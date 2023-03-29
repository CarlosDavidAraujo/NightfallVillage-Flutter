import 'package:nightfall_village_flutter/models/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';

class Skill {
  String name;
  String description;
  String icon;
  bool targetType;
  int enableTurn;
  int turnItWasDisabled;

  Skill({required this.name, required this.description, required this.icon, required this.targetType, required this.enableTurn, required this.turnItWasDisabled});
}

class FakeName {
  String name;
  int duration;
  int turnItWasFaked;

  FakeName(String name, int duration, int turnItWasFaked) {
    this.name = name;
    this.duration = duration;
    this.turnItWasFaked = turnItWasFaked;
  }
}

class Role {
  Game? game;
  Player? player;
  String name;
  FakeName fakeName;
  String team;
  String species;
  bool interactWithDeadPlayers;
  String roleImg;
  String objective;
  Map<int, Skill>> skills;

 Role({
  required String name,
  required String team,
  required String species,
  required bool interactWithDeadPlayers,
  required String roleImg,
  required String objective,
  required Map<int, Skill> skills,
})  : game = null,
      player = null,
      name = name,
      fakeName = {
        'name': name,
        'duration': 0,
        'turnItWasFaked': 0,
      },
      team = team,
      species = species,
      interactWithDeadPlayers = interactWithDeadPlayers,
      roleImg = roleImg,
      objective = objective,
      skills = skills;
