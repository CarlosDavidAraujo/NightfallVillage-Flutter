import 'package:nightfall_village_flutter/models/role/assassin.dart';
import 'package:nightfall_village_flutter/models/role/crusader.dart';
import 'package:nightfall_village_flutter/models/role/doctor.dart';
import 'package:nightfall_village_flutter/models/role/gunslinger.dart';
import 'package:nightfall_village_flutter/models/role/hunter.dart';
import 'package:nightfall_village_flutter/models/role/necromancer.dart';
import 'package:nightfall_village_flutter/models/role/priest.dart';
import 'package:nightfall_village_flutter/models/role/role.dart';
import 'package:nightfall_village_flutter/models/role/scientist.dart';
import 'package:nightfall_village_flutter/models/role/seer.dart';
import 'package:nightfall_village_flutter/models/role/tough_guys.dart';
import 'package:nightfall_village_flutter/models/role/undead.dart';
import 'package:nightfall_village_flutter/models/role/villager.dart';
import 'package:nightfall_village_flutter/models/role/werewolf.dart';
import 'package:nightfall_village_flutter/models/role/witch.dart';

class RoleMap {
  List<Role> map = [
    Villager.info(),
    Seer.info(),
    Doctor.info(),
    Crusader.info(),
    Gunslinger.info(),
    Hunter.info(),
    OldMan.info(),
    Priest.info(),
    Scientist.info(),
    ToughGuy.info(),
    Werewolf.info(),
    LonelyWerewolf.info(),
    Witch.info(),
    Necromancer.info(),
    Undead.info(),
    Assassin.info()
  ];
}
