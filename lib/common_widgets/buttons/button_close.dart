import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  final VoidCallback onPress;

  const ButtonClose({
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: ImageIcon(
        AssetImage('assets/icons/close.png'),
      ),
    );
  }
}
