import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/common_widgets/buttons/button_close.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    Key? key,
    required this.playerName,
    required this.onChangeText,
    required this.onClose,
    required this.index,
  }) : super(key: key);

  final String playerName;
  final ValueChanged<String> onChangeText;
  final Function(int) onClose;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: TextField(
              controller: TextEditingController(text: playerName),
              onChanged: onChangeText,
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.headlineSmall)),
      ButtonClose(onPress: () => onClose(index))
    ]);
  }
}
