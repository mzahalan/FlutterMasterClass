mixin Stats {
  final minValue = 5;

  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  int get points => _points;

  Map<String, int> get statsAsMap => {
    'health': _health,
    'attack': _attack,
    'defense': _defense,
    'skill': _skill,
  };

  List<Map<String, String>> get statsAsList => [
    {'title': 'health', 'value': _health.toString()},
    {'title': 'attack', 'value': _attack.toString()},
    {'title': 'defense', 'value': _defense.toString()},
    {'title': 'skill', 'value': _skill.toString()},
  ];
  
  void increaseStat(String stat) {
    if(_points > 0) {
      if(stat == 'health') {
        _health++;
        _points--;
      }

      if(stat == 'attack') {
        _attack++;
        _points--;
      }

      if(stat == 'defense') {
        _defense++;
        _points--;
      }

      if(stat == 'skill') {
        _skill++;
        _points--;
      }
    }
  }

  void decreaseStat(String stat) {
    if(stat == 'health' && _health > minValue) {
      _health--;
      _points++;
    }

    if(stat == 'attack' && _attack > minValue) {
      _attack--;
      _points++;
    }

    if(stat == 'defense' && _defense > minValue) {
      _defense--;
      _points++;
    }

    if(stat == 'skill' && _skill > minValue) {
      _skill--;
      _points++;
    }
  }
}