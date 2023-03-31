import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';

class Skill {
  String name;
  String description;
  String icon;
  bool targetType;
  int enableTurn;
  int turnItWasDisabled;

  Skill(
      {required this.name,
      required this.description,
      required this.icon,
      required this.targetType,
      required this.enableTurn,
      required this.turnItWasDisabled});
}

class FakeName {
  String name;
  int duration;
  int turnItWasFaked;

  FakeName(
      {required this.name,
      required this.duration,
      required this.turnItWasFaked});
}

class Role {
  Game? game;
  Player? player;
  String name;
  FakeName? fakeName;
  String team;
  String? species;
  bool? interactWithDeadPlayers;
  String roleImg;
  String objective;
  Map<int, Skill> skills;

  Role(
      {required this.name,
      required this.team,
      required this.species,
      required this.interactWithDeadPlayers,
      required this.roleImg,
      required this.objective,
      required this.skills,
      required this.game,
      required this.player})
      : fakeName = FakeName(name: name, duration: 0, turnItWasFaked: -1);

  Role.info(
      {required this.name,
      required this.team,
      required this.roleImg,
      required this.objective,
      required this.skills});

  // --------- GETTERS --------- //

  /// Retorna o nome da habilidade com o índice fornecido.
  ///
  /// @param skill Índice da habilidade (deve ser 1 ou 2).
  String getSkillName(int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    return skills[skill]!.name;
  }

  /// Retorna a descrição da habilidade com o índice fornecido.
  ///
  /// @param skill Índice da habilidade (deve ser 1 ou 2).
  String getSkillDescription(int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    return skills[skill]!.description;
  }

  /// Retorna o caminho para o ícone da habilidade com o índice fornecido.
  ///
  /// @param skill Índice da habilidade (deve ser 1 ou 2).
  String getSkillIcon(int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    return skills[skill]!.icon;
  }

  /// Retorna true se o jogador puder interagir com jogadores mortos.
  bool canInteractWithDeadPlayers() =>
      interactWithDeadPlayers == true && game!.deadPlayers.isNotEmpty == true;

  //----------GERENCIAMENTO DE NOMES FALSOS------------//
  //
  /// Define um novo nome falso para o jogador.
  ///
  /// @param newName Novo nome falso.
  ///
  /// @param duration Quantidade de turnos em que o nome falso será exibido.
  void setFakeName(String newName, int duration) {
    fakeName!.name = newName;
    fakeName!.duration = duration * 2;
    fakeName!.turnItWasFaked = game!.currentTurn;
  }

  /// Retorna true se o jogador tiver um nome falso ativo no momento.
  bool hasFakeName() {
    return fakeName!.duration + fakeName!.turnItWasFaked >= game!.currentTurn;
  }

  /// Retorna o nome falso do jogador, ou o correto caso ele nao tenha um.
  String getFakeName() => hasFakeName() ? fakeName!.name : name;

  /// Retorna a habilidade com o índice fornecido.
  ///
  /// @param skill Índice da habilidade (deve ser 1 ou 2).
  Skill getSkill(int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    return skills[skill]!;
  }

  ///Desativa a habilidade do papel deste jogador por uma determinada quantidade de turnos.
  ///
  ///@param skill Índice da habilidade a ser desativada (deve ser 1 ou 2).
  ///
  ///@param duration Quantidade de turnos em que a habilidade ficará desativada.
  void disableSkill(int skill, int duration) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    var currentTurn = game!.currentTurn;
    var enableTurn = skills[skill]!.enableTurn;
    var newEnableTurn = duration * 2 + currentTurn;
    var canOverrideCurrentDuration = enableTurn < newEnableTurn;
    skills[skill]!.enableTurn =
        canOverrideCurrentDuration ? newEnableTurn : enableTurn;
    skills[skill]!.turnItWasDisabled = currentTurn;
  }

  /// Verifica se a habilidade está desabilitada para o jogador atual.
  ///
  /// @param skill Índice da habilidade a ser verificada (deve ser 1 ou 2).
  ///
  /// @return Retorna `true` se a habilidade estiver desativada e `false` caso contrário.
  bool isSkillDisabled(int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    var enableTurn = skills[skill]!.enableTurn;
    var turnItWasDisabled = skills[skill]!.turnItWasDisabled;
    var currentTurn = game!.currentTurn;
    var inDisableRange = enableTurn >= currentTurn;
    return inDisableRange && turnItWasDisabled != currentTurn;
  }

  /// Verifica se a habilidade escolhida tem um alvo inválido no jogador informado.
  ///
  /// @param targetPlayer Jogador que seria o alvo da habilidade.
  ///
  /// @param skill Habilidade escolhida pelo jogador atual.
  ///
  /// @return Retorna `true` se a habilidade tiver um alvo inválido e `false` caso contrário.
  bool skillHasInvalidTargetOn(Player targetPlayer, int skill) {
    if (skill != 1 && skill != 2) {
      throw Exception(
          'Índice de habilidade inválido: $skill. O índice deve estar entre 1 e 2.');
    }
    return false;
  }
}
