import 'dart:math';
import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/player.dart';

/// Classe responsável por gerenciar as votações dos jogadores
class VotingManager {
  final Game game;
  List<Player> _mostVotedPlayers = [];

  /// Construtor da classe VotingManager, recebe uma instância da classe Game
  VotingManager(this.game) {
    _mostVotedPlayers;
  }

  /// Zera os votos dos jogadores vivos.
  void clearPlayersVotes() {
    for (var player in game.alivePlayers) {
      player.clearVotes();
    }
  }

  /// Atualiza a lista de jogadores com mais votos.
  void _updateMostVotedPlayers() {
    var maxVotes = 0;
    _mostVotedPlayers = [];

    for (var player in game.alivePlayers) {
      if (player.votesCount > maxVotes) {
        maxVotes = player.votesCount;
        _mostVotedPlayers = [player];
      } else if (player.votesCount == maxVotes && maxVotes > 0) {
        _mostVotedPlayers.add(player);
      }
    }
  }

  //-----------VOTAÇÃO DA VILA---------//

  /// Remove o jogador mais votado pela vila.
  void removeMostVotedPlayer() {
    _updateMostVotedPlayers();
    if (_didVoteTie()) {
      return game.messages.setMessage("A aldeia ficou indecisa!");
    }
    var mostVotedPlayer = _mostVotedPlayers[0];
    mostVotedPlayer.sendLynchingMessage();
    _updateAlivePlayers(mostVotedPlayer);
    game.deadPlayers.add(mostVotedPlayer);
    _mostVotedPlayers = [];
    clearPlayersVotes();
  }

  /// Verifica se a votação empatou
  bool _didVoteTie() {
    return _mostVotedPlayers.length != 1;
  }

  /// Atualiza a lista de jogadores vivos sem o jogador mais votado
  void _updateAlivePlayers(Player mostVotedPlayer) {
    game.alivePlayers = game.alivePlayers
        .where((player) => player.ID != mostVotedPlayer.ID)
        .toList();
  }

  //------------VOTAÇÃO DOS LOBISOMENS-------------//

  /// Define a vítima dos lobisomens para a rodada.
  void setWerewolfsVictim() {
    _updateMostVotedPlayers();
    if (_mostVotedPlayers.isEmpty) {
      return;
    }
    _resolveTieBreak();
    var tauntingPlayer =
        game.alivePlayers.firstWhere((player) => player.hasTaunt());
    var mostVotedPlayer = tauntingPlayer ?? _mostVotedPlayers[0];
    if (mostVotedPlayer.role.name == "Valentão" &&
        !mostVotedPlayer.isProtected()) {
      mostVotedPlayer.dieAfterManyTurns(2);
      mostVotedPlayer.inevitableDeath = true;
      _mostVotedPlayers = [];
      return;
    }
    mostVotedPlayer.dieAfterManyTurns(1);
    _mostVotedPlayers = [];
    clearPlayersVotes();
  }

  /// Desempata a votação aleatoriamente
  void _resolveTieBreak() {
    if (_mostVotedPlayers.length > 1) {
      final randomIndex = Random().nextInt(_mostVotedPlayers.length);
      var mostVotedPlayer = _mostVotedPlayers[randomIndex];
      _mostVotedPlayers = [mostVotedPlayer];
    }
  }
}
