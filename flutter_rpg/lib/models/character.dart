import 'package:flutter_rpg/models/stats.dart';

class Character with Stats {

  Character({
    required this.name,
    required this.slogal,
    required this.id
  });
  
  final String name;
  final String slogal;
  final String id;

  bool _isFav = false;
  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}