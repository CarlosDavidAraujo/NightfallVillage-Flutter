import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/common_widgets/containers/container_old_paper.dart';
import 'package:nightfall_village_flutter/features/set_roles/data/role_map.dart';
import 'package:nightfall_village_flutter/features/set_roles/widgets/card.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';

class RoleChoiceScreen extends StatefulWidget {
  const RoleChoiceScreen({super.key});

  @override
  _RoleChoiceScreen createState() => _RoleChoiceScreen();
}

class _RoleChoiceScreen extends State<RoleChoiceScreen> {
  List<Role> roles = RoleMap().map;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              'Selecione os papéis que irão ser sorteados entre os jogadores')),
      body: ContainerOldPaper(
          child: Column(children: [
        Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 4 / 7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [...roles.map((role) => RoleCard(role: role))])),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/roles'),
            child: Text('Confirmar'))
      ])),
    );
  }
}
