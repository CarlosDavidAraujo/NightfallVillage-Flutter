import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            Text('Nightfall village',
                style: GoogleFonts.newRocker(fontSize: 40)),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/players');
              },
              child: Text('Iniciar novo jogo'),
            )
          ])),
    );
  }
}
