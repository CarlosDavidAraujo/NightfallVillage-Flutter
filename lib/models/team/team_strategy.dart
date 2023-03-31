import 'package:nightfall_village_flutter/models/game/game.dart';

/// Uma classe abstrata que define a estratégia de vitória de uma equipe em um jogo.
abstract class TeamStrategy {
  final Game game;

  /// Construtor que recebe uma instância da classe [Game].
  TeamStrategy(this.game);

  /// Método que verifica se a equipe alcançou a vitória.
  ///
  /// Retorna um valor booleano indicando se a equipe alcançou a vitória.
  bool checkVictory();

  /// Retorna uma string com a mensagem de vitória da equipe.
  String getVictoryMessage();
}
