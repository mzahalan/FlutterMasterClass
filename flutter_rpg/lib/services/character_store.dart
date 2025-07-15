import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';

import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {

  final List<Character> _characters = [];
    //   // Raider Characters
    //   Character(name: 'Kael', slogan: 'Swift as wind, sharp as steel', vocation: Vocation.raider, id: 'raider_01'),
      
    //   // Mage Characters
    //   Character(name: 'Zara', slogan: 'Knowledge is the ultimate power', vocation: Vocation.mage, id: 'mage_01'),
      
    //   // Warrior Characters
    //   Character(name: 'Thorin', slogan: 'Strength conquers all obstacles', vocation: Vocation.warrior, id: 'warrior_01'),
      
    //   // Archer Characters
    //   Character(name: 'Finn', slogan: 'One shot, one kill', vocation: Vocation.archer, id: 'archer_01'),
      
    //   // Healer Characters
    //   Character(name: 'Sage', slogan: 'Life flows eternal', vocation: Vocation.healer, id: 'healer_02'),
      
    //   // Rogue Characters
    //   Character(name: 'Nyx', slogan: 'Unseen, unheard, unstoppable', vocation: Vocation.rogue, id: 'rogue_02'),
    // ];

  List<Character> get characters => _characters;


  // initially fetch characters
  void fetchCharactersOnce() async {
    if (_characters.isEmpty) {
      final snapshot = await FirestoreService.getCharacters();
      for(var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  // Add Character
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
  }
  // remove character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);
    _characters.remove(character);
    notifyListeners();
  }
}