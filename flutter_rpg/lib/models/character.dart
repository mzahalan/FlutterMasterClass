class Character {

  Character({
    required this.name,
    required this.slogal,
    required this.id
  });
  
  final String name;
  final String slogal;
  final String id;

  bool _isFav = false;

  void toggleIsFav() {
    _isFav = !_isFav;
  }
}