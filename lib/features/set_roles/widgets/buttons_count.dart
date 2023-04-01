/* import 'package:flutter/material.dart';

class ButtonCount extends StatelessWidget {
  final Function? onIncrease;
  final Function? onDecrease;
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
      children: [
        IconButton(onPressed: () => onDecrease, icon: Icon(Icons.plus_one)),
        Text(count.toString(), style: Theme.of(context).textTheme.labelMedium),
        IconButton(onPressed: () => onIncrease, icon: Icon(Icons.remove))
      ],
    );
  }
} */
