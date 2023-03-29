import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/common_widgets/containers/container_old_paper.dart';
import 'package:nightfall_village_flutter/features/set_players/button_add_player.dart';
import 'package:nightfall_village_flutter/features/set_players/player_card.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  final List<String> _playerNames = [
    'Jogador 1',
    'Jogador 2',
    'Jogador 3',
    'Jogador 4',
  ];

  void _addPlayer() {
    int numberOfNewPlayer = _playerNames.length + 1;
    setState(() {
      _playerNames.add('Jogador $numberOfNewPlayer');
    });
  }

  void _removePlayer(int index) {
    setState(() {
      _playerNames.removeAt(index);
    });
  }

  void _updatePlayerName(int index, String value) {
    setState(() {
      _playerNames[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerOldPaper(
            child: Column(children: [
      Text('Rol dos Habitantes', style: Theme.of(context).textTheme.titleLarge),
      Expanded(
          child: GridView.count(
              primary: false,
              childAspectRatio: 5 / 1,
              crossAxisCount: 1,
              padding: EdgeInsets.symmetric(horizontal: 40),
              children: [
            ..._playerNames.asMap().entries.map((entry) => PlayerCard(
                playerName: entry.value,
                index: entry.key,
                onChangeText: (text) => _updatePlayerName(entry.key, text),
                onClose: (index) => _removePlayer(index))),
            ButtonAddPlayer(onPressed: () => _addPlayer())
          ])),
      SizedBox(height: 50),
      Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
              icon: Stack(alignment: Alignment.center, children: [
                Image.asset('assets/icons/wax_seal.png', width: 120),
                Text(
                  'CONFIRMAR',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ]),
              onPressed: () {
               Navigator.pushNamed(context, '/roles');
              },
              label: const Text('')))
    ])));
  }
}
