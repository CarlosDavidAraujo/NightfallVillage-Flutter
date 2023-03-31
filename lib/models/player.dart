import 'package:nightfall_village_flutter/models/game/game.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';
import 'package:nightfall_village_flutter/models/role/undead.dart';

class Player {
  String name;
  int ID;
  Game game;
  Role role;
  int votesCount;
  int disabledVoteDuration;
  bool duplicatedVote;
  bool confused;
  int protectionDuration;
  Player? protector;
  bool protectionBarrier;
  bool infected;
  bool taunt;
  int deathTurn;
  bool inevitableDeath;
  int resurrectTurn;

  Player(
      {required this.name,
      required this.ID,
      required this.game,
      required this.role})
      : votesCount = 0,
        disabledVoteDuration = -1,
        duplicatedVote = false,
        confused = false,
        protectionDuration = -1,
        protector = null,
        protectionBarrier = false,
        infected = false,
        taunt = false,
        deathTurn = -1,
        inevitableDeath = false,
        resurrectTurn = -1;

  //------------GETTERS E SETTERS BÁSICOS----------//

  /// Zera a contagem de votos do jogador.
  void clearVotes() => votesCount = 0;

  /// Retorna true se o jogador estiver com peso dois, false caso contrário.
  bool hasDuplicatedVote() => duplicatedVote == true;

  ///Retorna true se o jogador estiver confuso, false caso contrário.
  bool isConfused() => confused == true;

  ///Checa se o jogador irá morrer inevitavelmente.
  ///
  ///@return true se o jogador irá morrer, false caso contrário.
  bool hasInevitableDeath() => inevitableDeath == true;

  /// Define a quantidade de turnos que o jogador estará protegido.
  ///
  /// @params duration: a quantidade de turnos.
  void setProtectedTurnsDuration(int duration) {
    if (hasInevitableDeath()) return;
    protectionDuration = duration * 2 + game.currentTurn;
  }

  ///Checa se um jogador está protegido.
  ///
  ///@return true se a duração da proteção for maior que o turno atual, false caso contrário.
  bool isProtected() => protectionDuration >= game.currentTurn;

  ///Retorna true se o jogador foi protegido por um cruzado, false caso contrário.
  bool hasProtector() => protector != null;

  ///Retorna true se o jogador tem uma barreira de proteção, false caso contrário.
  bool hasProtectionBarrier() => protectionBarrier == true;

  ///Retorna true se o jogador estive infectado, false caso contrário.
  bool isInfected() => infected == true;

  /// Retorna true se o jogador tem um provocação ativa, false caso contrario.
  bool hasTaunt() => taunt == true;

  /// Retona true se o jogador pertence ao time dos lobisomens, false caso contrario.
  bool belongsToWerewolvesTeam() => role.team == "Lobisomens";

  /// Retona true se o jogador pertence ao time dos aldeões, false caso contrario.
  bool belongsToVillagersTeam() => role.team == "Aldeões";

  /// Retona true se o jogador pertence ao time dos mortos-vivos, false caso contrario.
  bool belongsToUndeadsTeam() => role.team == "Undeads";

  /// Retona true se a espécie do papel do jogador for humano, false caso contrario.
  bool isHuman() => role.species == "Human";

  /// Retona true se o a espécie do papel jogador for lobisomem, false caso contrario.
  bool isWolf() => role.species == "Wolf";

  /// Retona true se o papel do jogador for lobisomem solitário, false caso contrario.
  bool isLonelyWolf() => role.name == "Lobisomem solitário";

  /// Retona true se a espeécie do papel jogador for morto-vivo, false caso contrario.
  bool isUndead() => role.species == "Undead";

  /// Retorna true se o papel do jogador for assassino em série, false caso contrario.
  bool isAssassin() => role.name == "Assassino em Série";

  /// Retorna aos estados iniciais os atributos do jogador que são renovados a cada turno.
  void resetAllStates() {
    votesCount = 0;
    duplicatedVote = false;
    confused = false;
    protector = null;
  }

  //----------MÉTODOS DE VOTOS------------//

  /// Vota em um jogador alvo. Se o jogador votante estiver confuso, escolhe aleatoriamente outro alvo.
  /// Se o jogador votante tiver voto duplo, adiciona dois votos ao jogador alvo. Caso contrário,
  /// adiciona um voto ao jogador alvo.
  ///
  /// @param targetPlayer O jogador alvo para votar.
  void voteOn(Player targetPlayer) {
    var player = targetPlayer;
    if (isConfused()) {
      player = game.getRandomPlayer();
    }
    if (hasDuplicatedVote()) {
      player.votesCount += 2;
      return;
    }
    player.votesCount += 1;
  }

  /// Define a duração em turnos que este jogador não poderá votar.
  ///
  /// @param duration A duração em turnos da restrição de voto.
  void setDisabledVoteDuration(int duration) {
    var currentTurn = game.currentTurn;
    disabledVoteDuration = duration * 2 + currentTurn - 1;
  }

  /// Retorna true se este jogador esta com voto desabilitado, false caso contrário.
  bool hasDisabledVote() => disabledVoteDuration >= game.currentTurn;

  //-----------MÉTODOS DE REMOÇÃO-------------//

  /// Retorna true se este jogador puder ser morto, false caso contrário.
  bool shouldDie() => game.currentTurn == deathTurn && !isProtected();

  /// Marca em turnos o prazo da morte deste jogador.
  /// Se a barreira de proteção estiver ativa ou o jogador estiver protegido, o jogador não morrerá.
  /// Ex: se turnos for 1, o jogador morre ao final da noite atual, se for 2, morre no final da próxima noite e assim por diante.
  ///
  /// @param turns A quantidade de turnos até a morte do jogador.
  void dieAfterManyTurns(int turns) {
    if (protectionBarrier) {
      protectionBarrier = false;
      return;
    }
    var currentTurn = game.currentTurn;
    var currentDeathTurn = deathTurn;
    var newDeathTurn = turns * 2 + currentTurn - 1;
    deathTurn =
        newDeathTurn > currentDeathTurn ? newDeathTurn : currentDeathTurn;
  }

  /// Adiciona à lista de mensagens do jogo o aviso de morte do jogador durante a noite .
  void sendDeathMessage() {
    var messages = game.messages;
    messages.addMessage(
        '$name morreu esta noite. Deve ficar calado até o fim do jogo.');
  }

  /// Adiciona à lista de mensagens do jogo o aviso de morte do jogador pela votação.
  void sendLynchingMessage() {
    var messages = game.messages;
    messages.addMessage(
        'A vila linchou $name. Deve ficar calado até o fim do jogo.');
  }

  //----------MÉTODOS DE RESSURREIÇÃO------------//

  /// Marca em turnos o prazo da ressurreição deste jogador.
  /// Ex: se turnos for 1, o jogador ressussita ao final da noite atual, se for 2, ressussita ao final da próxima noite e assim por diante.
  ///
  /// @param turns A quantidade de turnos até a ressurreição do jogador.
  void resurrectAfterManyTurns(int turns) {
    resurrectTurn = turns * 2 + game.currentTurn - 1;
  }

  ///Adiciona à lista de mensagens do jogo o aviso da ressurreição deste jogador.
  void sendResurrectMessage() {
    var messages = game.messages;
    messages.addMessage('$name foi ressuscitado.');
  }

  /// Verifica se este jogador deve ser ressussitado.
  bool shouldResurrect() => resurrectTurn == game.currentTurn;

  /// Ressucita o jogador permitindo que ele volte ao jogo.
  void resurrect() {
    var insertionPosition = _getInsertionPositionOfResurrected();
    game.deadPlayers.insert(insertionPosition, this);
    resetAllStates();
    sendResurrectMessage();
  }

  /// Retorna o index da posição em que o jogador ressucitado será inserido de volta na lista de jogadores vivos.
  int _getInsertionPositionOfResurrected() {
    var originalPlayerPositionInQueue = ID;
    var nearestOtherPlayerPosition = game.alivePlayers
        .indexWhere((p) => p.ID > originalPlayerPositionInQueue);
    var insertionIndex = nearestOtherPlayerPosition != -1
        ? nearestOtherPlayerPosition
        : game.alivePlayers.length;
    return insertionIndex;
  }

  //------------TRANSFORMAÇÃO DE ZUMBIS------------//

  void transformInUndead() {
    dieAfterManyTurns(2);
    disabledVoteDuration = 1000;
    infected = true;
    var undead = Undead(game, this);
    role = undead;
  }
}
