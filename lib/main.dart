import 'package:flutter/material.dart';
import 'package:nightfall_village_flutter/features/set_players/players_screen.dart';
import 'package:nightfall_village_flutter/features/set_roles/screen.dart';
import 'package:nightfall_village_flutter/features/start_game/home.dart';
import 'package:nightfall_village_flutter/themes/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: CustomTheme.lightTheme,
      // A widget which will be started on application startup
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/players': (context) => PlayersScreen(),
        '/roles': (context) => RoleChoiceScreen()
      },
    );
  }
}
