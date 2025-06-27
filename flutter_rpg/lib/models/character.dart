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
  final String name;
  final String slogal;
  final String id;

  bool _isFav = false;
  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}