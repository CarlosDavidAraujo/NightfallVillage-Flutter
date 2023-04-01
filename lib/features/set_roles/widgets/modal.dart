import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/common_widgets/buttons/button_skill.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class RoleModal extends StatelessWidget {
  final Role role;
  const RoleModal({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(role.name, style: Theme.of(context).textTheme.titleLarge),
        Image.asset(role.roleImg),
        Column(
          children: [
            ButtonSkill(role: role, skill: 1),
            ButtonSkill(role: role, skill: 2)
          ],
        )
      ]),
    );
  }
}
