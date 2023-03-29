import 'package:flutter/material.dart';

class ContainerOldPaper extends StatelessWidget {
  const ContainerOldPaper({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xff794b22),
          ),
          BoxShadow(
            color: Theme.of(context).primaryColor,
            spreadRadius: -5,
            blurRadius: 20,
          )
        ]),
        child: child);
  }
}
