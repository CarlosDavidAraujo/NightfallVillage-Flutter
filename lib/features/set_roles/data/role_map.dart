import 'package:nightfall_village_flutter/models/role/assassin.dart';
import 'package:nightfall_village_flutter/models/role/crusader.dart';
import 'package:nightfall_village_flutter/models/role/doctor.dart';
import 'package:nightfall_village_flutter/models/role/gunslinger.dart';
import 'package:nightfall_village_flutter/models/role/hunter.dart';
import 'package:nightfall_village_flutter/models/role/necromancer.dart';
import 'package:nightfall_village_flutter/models/role/priest.dart';
import 'package:nightfall_village_flutter/models/role/scientist.dart';
import 'package:nightfall_village_flutter/models/role/seer.dart';
import 'package:nightfall_village_flutter/models/role/tough_guys.dart';
import 'package:nightfall_village_flutter/models/role/undead.dart';
import 'package:nightfall_village_flutter/models/role/villager.dart';
import 'package:nightfall_village_flutter/models/role/werewolf.dart';
import 'package:nightfall_village_flutter/models/role/witch.dart';

class RoleMap {
  final Map<String, List<Map<String, dynamic>>> _map = {
    'Selected': [
      {'role': Villager.info(), 'count': 2},
      {'role': Seer.info(), 'count': 1},
      {'role': Werewolf.info(), 'count': 1}
    ],
    'Aldeões': [
      {'role': Villager.info(), 'count': 0},
      {'role': Seer.info(), 'count': 0},
      {'role': Doctor.info(), 'count': 0},
      {'role': Crusader.info(), 'count': 0},
      {'role': Gunslinger.info(), 'count': 0},
      {'role': Hunter.info(), 'count': 0},
      {'role': OldMan.info(), 'count': 0},
      {'role': Priest.info(), 'count': 0},
      {'role': Scientist.info(), 'count': 0},
      {'role': ToughGuy.info(), 'count': 0},
    ],
    'Lobisomens': [
      {'role': Werewolf.info(), 'count': 0},
      {'role': LonelyWerewolf.info(), 'count': 0},
      {'role': Witch.info(), 'count': 0}
    ],
    'Mortos-vivos': [
      {'role': Necromancer.info(), 'count': 0},
      {'role': Undead.info(), 'count': 0},
    ],
    'Solo': [
      {'role': Assassin.info(), 'count': 0},
    ]
  };

  List<Map<String, dynamic>> getList(String team) {
    return _map[team]!;
  }
}
