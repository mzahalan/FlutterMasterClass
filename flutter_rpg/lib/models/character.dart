import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {

  Character({
    required this.name,
    required this.slogal,
    required this.vocation,
    required this.id
  });
  
  final Vocation vocation;
  final Set<Skill> skills = {};
  final String name;
  final String slogal;
  final String id;

  bool _isFav = false;
  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}


List<Character> allCharacters = [
  // Raider Characters
  Character(name: 'Kael', slogal: 'Swift as wind, sharp as steel', vocation: Vocation.raider, id: 'raider_01'),
  Character(name: 'Vera', slogal: 'Dance with death, emerge victorious', vocation: Vocation.raider, id: 'raider_02'),
  
  // Mage Characters
  Character(name: 'Zara', slogal: 'Knowledge is the ultimate power', vocation: Vocation.mage, id: 'mage_01'),
  Character(name: 'Magnus', slogal: 'Ice flows through my veins', vocation: Vocation.mage, id: 'mage_02'),
  
  // Warrior Characters
  Character(name: 'Thorin', slogal: 'Strength conquers all obstacles', vocation: Vocation.warrior, id: 'warrior_01'),
  Character(name: 'Lyra', slogal: 'Fear is for the weak', vocation: Vocation.warrior, id: 'warrior_02'),
  
  // Archer Characters
  Character(name: 'Finn', slogal: 'One shot, one kill', vocation: Vocation.archer, id: 'archer_01'),
  Character(name: 'Aria', slogal: 'Silent death from afar', vocation: Vocation.archer, id: 'archer_02'),
  
  // Healer Characters
  Character(name: 'Celeste', slogal: 'Light heals all wounds', vocation: Vocation.healer, id: 'healer_01'),
  Character(name: 'Sage', slogal: 'Life flows eternal', vocation: Vocation.healer, id: 'healer_02'),
  
  // Rogue Characters
  Character(name: 'Raven', slogal: 'Death comes from the shadows', vocation: Vocation.rogue, id: 'rogue_01'),
  Character(name: 'Nyx', slogal: 'Unseen, unheard, unstoppable', vocation: Vocation.rogue, id: 'rogue_02'),
];