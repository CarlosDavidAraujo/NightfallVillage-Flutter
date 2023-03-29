import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAddPlayer extends StatelessWidget {
  const ButtonAddPlayer({Key? key, required this.onPressed}) : super(key: key);
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('ADICIONAR', style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
