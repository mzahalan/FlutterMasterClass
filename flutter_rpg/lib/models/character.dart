import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {

  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id
  });
  
  final Vocation vocation;
  final Set<Skill> skills = {};
  final String name;
  final String slogan;
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

  factory Character.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    final data = snapshot.data()!;

    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere((voc) => voc.toString() == data['vocation']),
      id: snapshot.id
    );

    data['skills'].forEach((skillId) {
      Skill skill = allSkills.firstWhere((skill) => skill.id == skillId);
      character.updateSkill(skill);
    });

    if(data['isFav'] == true) {
      character.toggleIsFav();
    }

    //stats & points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'vocation': vocation.toString(),
      'isFav' : _isFav,
      'skills' : skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points
    };
  }
}