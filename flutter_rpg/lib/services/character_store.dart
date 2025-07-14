import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/vocation.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [
      // Raider Characters
      Character(name: 'Kael', slogan: 'Swift as wind, sharp as steel', vocation: Vocation.raider, id: 'raider_01'),
      Character(name: 'Vera', slogan: 'Dance with death, emerge victorious', vocation: Vocation.raider, id: 'raider_02'),
      
      // Mage Characters
      Character(name: 'Zara', slogan: 'Knowledge is the ultimate power', vocation: Vocation.mage, id: 'mage_01'),
      Character(name: 'Magnus', slogan: 'Ice flows through my veins', vocation: Vocation.mage, id: 'mage_02'),
      
      // Warrior Characters
      Character(name: 'Thorin', slogan: 'Strength conquers all obstacles', vocation: Vocation.warrior, id: 'warrior_01'),
      Character(name: 'Lyra', slogan: 'Fear is for the weak', vocation: Vocation.warrior, id: 'warrior_02'),
      
      // Archer Characters
      Character(name: 'Finn', slogan: 'One shot, one kill', vocation: Vocation.archer, id: 'archer_01'),
      Character(name: 'Aria', slogan: 'Silent death from afar', vocation: Vocation.archer, id: 'archer_02'),
      
      // Healer Characters
      Character(name: 'Celeste', slogan: 'Light heals all wounds', vocation: Vocation.healer, id: 'healer_01'),
      Character(name: 'Sage', slogan: 'Life flows eternal', vocation: Vocation.healer, id: 'healer_02'),
      
      // Rogue Characters
      Character(name: 'Raven', slogan: 'Death comes from the shadows', vocation: Vocation.rogue, id: 'rogue_01'),
      Character(name: 'Nyx', slogan: 'Unseen, unheard, unstoppable', vocation: Vocation.rogue, id: 'rogue_02'),
    ];

  List<Character> get characters => _characters;

// Add Character
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

  // save (update) character
  // remove character
  // initially fetch characters
}