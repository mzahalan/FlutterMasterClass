
enum Vocation {
  raider(
    title: 'Raider',
    description: 'Raider is a melee fighter who specializes in close-range combat.',
    image: 'raider.png',
    ability: 'Whirlwind Strike',
    weapon: 'Sword',
  ),
  mage(
    title: 'Mage',
    description: 'Mage is a ranged fighter who specializes in long-range combat.',
    image: 'mage.png',
    ability: 'Arcane Explosion',
    weapon: 'Staff',
  ),
  warrior(
    title: 'Warrior',
    description: 'Warrior is a melee fighter who specializes in close-range combat.',
    image: 'warrior.png',
    ability: 'Berserker Rage',
    weapon: 'Axe',
  ),
  archer(
    title: 'Archer',
    description: 'Archer is a ranged fighter who specializes in precision attacks from a distance.',
    image: 'archer.png',
    ability: 'Precision Shot',
    weapon: 'Bow',
  ),
  healer(
    title: 'Healer',
    description: 'Healer is a support character who can restore health and provide buffs to allies.',
    image: 'healer.png',
    ability: 'Healing Touch',
    weapon: 'Staff',
  ),
  rogue(
    title: 'Rogue',
    description: 'Rogue is a stealthy fighter who excels at critical strikes and evasion.',
    image: 'rogue.png',
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