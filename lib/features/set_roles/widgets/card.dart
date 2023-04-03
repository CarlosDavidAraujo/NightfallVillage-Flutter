import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/features/set_roles/widgets/buttons_count.dart';
//import 'package:nightfall_village_flutter/features/set_roles/widgets/modal.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RoleCard extends StatelessWidget {
  final Role role;
  final VoidCallback? onDecrease;
  final VoidCallback? onIncrease;
  final int? count;
  final bool selected;
  const RoleCard(
      {Key? key,
      required this.role,
      this.onDecrease,
      this.onIncrease,
      this.count,
      this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.info),
                onPressed: null,
                /* showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return RoleModal(role: role);
              }) */
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.7,
              child: Image.asset(role.roleImg),
            ),        
            selected? ButtonCount(onIncrease: onIncrease, onDecrease: onDecrease, count: count) : SizedBox.shrink() 
          ],
        ));
  }
}
