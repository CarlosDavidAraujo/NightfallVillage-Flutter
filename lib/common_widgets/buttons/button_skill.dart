import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class ButtonSkill extends StatelessWidget {
  final Role role;
  final int skill;
  const ButtonSkill({Key? key, required this.role, required this.skill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: [
            Image.asset(role.getSkill(skill).icon),
            Text(role.getSkill(skill).name,
                style: Theme.of(context).textTheme.labelMedium)
          ],
        ),
        Expanded(
            child: Text(role.getSkill(skill).description,
                style: Theme.of(context).textTheme.labelMedium,
                softWrap: true)),
      ]),
    );
  }
}
