import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/common_widgets/containers/container_old_paper.dart';

class RoleChoiceScreen extends StatefulWidget {
  const RoleChoiceScreen({super.key});

  @override
  _RoleChoiceScreen createState() => _RoleChoiceScreen();
}

class _RoleChoiceScreen extends State<RoleChoiceScreen> {
  List<String> roles = ['aldeão', 'vidente', 'lobisomem', 'caçador'];

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
                children: [...roles.map((role) => Text('role'))])),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/roles'),
            child: Text('Confirmar'))
      ])),
    );
  }
}
