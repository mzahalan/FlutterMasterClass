enum Vocation {
  raider(
    title: 'Raider',
    description: 'Raider is a melee fighter who specializes in close-range combat.',
    image: 'assets/images/raider.png',
    ability: 'Whirlwind Strike',
    weapon: 'Sword',
  ),
  mage(
    title: 'Mage',
    description: 'Mage is a ranged fighter who specializes in long-range combat.',
    image: 'assets/images/mage.png',
    ability: 'Arcane Explosion',
    weapon: 'Staff',
  ),
  warrior(
    title: 'Warrior',
    description: 'Warrior is a melee fighter who specializes in close-range combat.',
    image: 'assets/images/warrior.png',
    ability: 'Berserker Rage',
    weapon: 'Axe',
  ),
  archer(
    title: 'Archer',
    description: 'Archer is a ranged fighter who specializes in precision attacks from a distance.',
    image: 'assets/images/archer.png',
    ability: 'Precision Shot',
    weapon: 'Bow',
  ),
  healer(
    title: 'Healer',
    description: 'Healer is a support character who can restore health and provide buffs to allies.',
    image: 'assets/images/healer.png',
    ability: 'Healing Touch',
    weapon: 'Staff',
  ),
  rogue(
    title: 'Rogue',
    description: 'Rogue is a stealthy fighter who excels at critical strikes and evasion.',
    image: 'assets/images/rogue.png',
    ability: 'Backstab',
    weapon: 'Dagger',
  );
  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.ability,
    required this.weapon,
  });

  final String title;
  final String description;
  final String image;
  final String ability;
  final String weapon;
}