import 'package:flutter/material.dart';

class ButtonCount extends StatelessWidget {
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final int? count;
  const ButtonCount(
      {Key? key,
      required this.onIncrease,
      required this.onDecrease,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: onDecrease, icon: Icon(Icons.remove)),
        Text(count.toString(), style: Theme.of(context).textTheme.labelMedium),
        IconButton(onPressed: onIncrease, icon: Icon(Icons.add))
      ],
    );
  }
} 
