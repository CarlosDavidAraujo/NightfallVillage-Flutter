import 'dart:math';

import 'package:nightfall_village_flutter/models/game/death_manager.dart';
import 'package:nightfall_village_flutter/models/game/game_messages.dart';
import 'package:nightfall_village_flutter/models/game/voting_manager.dart';
import 'package:nightfall_village_flutter/models/game/win_condition_manager.dart';
import 'package:nightfall_village_flutter/models/player.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class RoleData {
  String team;
  List<Role> data;

  RoleData({required this.team, required this.data});
}

class SelectedRole {
  Role role;
  int count;

  SelectedRole({required this.role, required this.count});
}

class Game {
  final List<Player> allPlayers;
  late List<Player> alivePlayers;
  late List<Player> deadPlayers;
  late GameMessages messages;
  late DeathManager deathManager;
  late VotingManager votingManager;
  late WinConditionManager winConditionManager;
  late int currentPlayerIndex;
  late int currentTurn;
  late List<Role> currentRoles;
  late List<Role> rolePreset;
  late List<RoleData> roleMap;
  late List<SelectedRole> selectedRoles;

  Game({required this.allPlayers, required this.selectedRoles}) {
    alivePlayers = allPlayers;
    deadPlayers = [];
    messages = GameMessages();
    deathManager = DeathManager(this);
    votingManager = VotingManager(this);
    winConditionManager = WinConditionManager(this);
    currentPlayerIndex = 0;
    currentTurn = 0;
    currentRoles = [];
    /* rolePreset = [Villager(), Seer(), WereWolf()];
    roleMap = [
      RoleData(team: "Aldeões", data: [
        Villager(),
        Seer(),
        Doctor(),
        Crusader(),
        Gunslinger(),
        Hunter(),
        OldMan(),
        Priest(),
        Scientist(),
        ToughGuy(),
      ]),
      RoleData(
          team: "Lobisomens", data: [WereWolf(), LonelyWerewolf(), Witch()]),
      RoleData(team: "Mortos-vivos", data: [Necromancer(), Undead()]),
      RoleData(team: "Solo", data: [Assassin()]),
    ]; */
  }

  //--------GETTERS E SETTERS BÁSICOS---------//

  List<String> getTurnMessages() => messages.messages;

  void _advanceTurn() => currentTurn++;

  /* void setAlivePlayers(List<String> playerNames) {
    alivePlayers = [];
    for (var i = 0; i < playerNames.length; i++) {
      var player = Player(name: playerNames[i], ID: i, game: this);
      alivePlayers.add(player);
    }
  } */

  Player getRandomPlayer() {
    var randomIndex = Random().nextInt(alivePlayers.length);
    return alivePlayers[randomIndex];
  }

  Player getCurrentPlayer() => alivePlayers[currentPlayerIndex];

  void incrementCurrentPlayerIndex() => currentPlayerIndex++;

  bool noNextPlayer() {
    var result = false;
    if (currentPlayerIndex > alivePlayers.length - 1) {
      currentPlayerIndex = 0;
      result = true;
    }
    return result || alivePlayers.isEmpty;
  }

  //----------SETTERS DE PLAYERS E ROLES------------//

/*   void _setRoles(List<SelectedRole> selectedRoles) {
    currentRoles = [];
    for (var selectedRole in selectedRoles) {
      var role = selectedRoles.role;
      var count = selectedRoles.count;
      for (var i = 0; i < count; i++) {
        currentRoles.add(role);
      }
    }
    currentRoles.shuffle();
  }

  void assignRoleToPlayer(List<SelectedRole> selectedRoles) {
    _setRoles(selectedRoles);
    for (var i =0; i < allPlayers.length; i++) {
      roleCopy
    }
    this.alivePlayers.forEach((player, i) => {
      const roleCopy = _.cloneDeep(this.currentRoles[i]);
      roleCopy.setCurrentGame(this);
      player.setRole(roleCopy);
      roleCopy.setPlayer(player);
    });
    this.allPlayers = this.alivePlayers;
  } */

  //--------------GERENCIAMENTO DE FIM DE TURNO------------------//

  void _resetAllPlayersStates() {
    for (var player in alivePlayers) {
      player.resetAllStates();
    }
  }

  void endDay() {
    votingManager.removeMostVotedPlayer();
    _resetAllPlayersStates();
    _advanceTurn();
  }

  void endNight() {
    votingManager.setWerewolfsVictim();
    _advanceTurn();
    deathManager.removePlayers();
    deathManager.revivePlayers();
  }
}
