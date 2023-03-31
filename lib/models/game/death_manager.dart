import 'package:nightfall_village_flutter/models/game/game.dart';

/// Classe responsável por gerenciar a morte e ressurreição de jogadores no jogo.
class DeathManager {
  final Game game;

  /// Construtor da classe [DeathManager].
  /// Recebe como parâmetro uma instância da classe [Game].
  DeathManager(this.game);

  //-----REMOÇÃO DE JOGADORES-----//

  /// Função responsável por remover jogadores mortos do jogo.
  void removePlayers() {
    for (var player in game.alivePlayers) {
      if (player.shouldDie() && player.hasProtector()) {
        var protector = player.protector!;
        game.deadPlayers.add(protector);
        protector.resetAllStates();
        protector.sendDeathMessage();
      } else if (player.shouldDie()) {
        game.deadPlayers.add(player);
        player.resetAllStates();
        player.sendDeathMessage();
      }
    }
    _updateAlivePlayers();
  }

  /// Função privada responsável por atualizar a lista de jogadores vivos do jogo
  /// após a remoção dos jogadores mortos.
  void _updateAlivePlayers() {
    var remainingAlivePlayers = game.alivePlayers
        .where((player) => game.deadPlayers.contains(player))
        .toList();
    var noOneDied = game.alivePlayers.length == remainingAlivePlayers.length;
    if (noOneDied) {
      game.messages.addMessage("Noite de paz na vila.");
    }
    game.alivePlayers = remainingAlivePlayers;
  }

  //-----RESSURREIÇÃO DE JOGADORES-----//

  /// Função responsável por ressuscitar jogadores que podem ser ressuscitados.
  void revivePlayers() {
    for (var player in game.deadPlayers) {
      player.resurrect();
    }
    _updateDeadPlayers();
  }

  /// Função privada responsável por atualizar a lista de jogadores mortos do jogo
  /// após a ressurreição dos jogadores que podem ser ressuscitados.
  void _updateDeadPlayers() {
    game.deadPlayers =
        game.deadPlayers.where((player) => !player.shouldResurrect()).toList();
  }
}
