import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/features/set_roles/widgets/buttons_count.dart';
import 'package:nightfall_village_flutter/features/set_roles/widgets/modal.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';
//import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class RoleCard extends StatelessWidget {
  final Role role;
  final Function? onDecrease;
  final Function? onIncrease;
  final int? count;
  const RoleCard(
      {Key? key,
      required this.role,
      this.onDecrease,
      this.onIncrease,
      this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Align(
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
            Image.asset(role.roleImg),
            /*  ButtonCount(
                onIncrease: onIncrease, onDecrease: onDecrease, count: count) */
          ],
        ));
  }
}
