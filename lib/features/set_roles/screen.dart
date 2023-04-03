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
  RoleMap roleMap = RoleMap();

  void _increaseRoleCount(int index) {
    setState(() {
      roleMap.getList('Selected')[index]['count']++;
    });
  }

  void _decreaseRoleCount(int index) {
    setState(() {
      roleMap.getList('Selected')[index]['count']--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
              'Selecione os papéis que irão ser sorteados entre os jogadores')),
      body: ContainerOldPaper(
        
          child: Column(children: [
        Expanded(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Papéis selecionados', style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 4 / 7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...roleMap
                    .getList('Selected')
                    .asMap()
                    .entries
                    .map((e) => RoleCard(
                          role: e.value['role'],
                          count: e.value['count'],
                          onDecrease: () => _decreaseRoleCount(e.key),
                          onIncrease: () => _increaseRoleCount(e.key),
                          selected: true,
                        ))
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Aldeões', style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...roleMap
                    .getList('Aldeões')
                    .asMap()
                    .entries
                    .map((e) => RoleCard(
                          role: e.value['role'],

                        ))
              ],
            ),SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Lobisomens', style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...roleMap
                    .getList('Lobisomens')
                    .asMap()
                    .entries
                    .map((e) => RoleCard(
                          role: e.value['role'],

                        ))
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Mortos-vivos', style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...roleMap
                    .getList('Mortos-vivos')
                    .asMap()
                    .entries
                    .map((e) => RoleCard(
                          role: e.value['role'],

                        ))
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Solo', style: Theme.of(context).textTheme.titleLarge,),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ...roleMap
                    .getList('Solo')
                    .asMap()
                    .entries
                    .map((e) => RoleCard(
                          role: e.value['role'],
                        
                        ))
              ],
            )
          ],
        ) 
            ),
        ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/roles'),
            child: const Text('Confirmar'))
      ])),
    );
  }
}
