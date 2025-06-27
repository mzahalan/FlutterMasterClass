import 'package:flutter_rpg/models/vocation.dart';

class Skill {
  final String name;
  final String image;
  final String description;
  final Vocation vocation;
  final String id;

  Skill({
    required this.name,
    required this.image,
    required this.description,
    required this.vocation,
    required this.id
  });

}


final List<Skill> allSkills = [
  // Raider Skills - Sword-based melee fighter
  Skill(name: 'Whirlwind Strike', image: 'whirlwind_strike.png', vocation: Vocation.raider, id: 'raider_whirlwind',
    description: 'Spin rapidly with your sword, dealing damage to all nearby enemies.'),
  Skill(name: 'Precision Thrust', image: 'precision_thrust.png', vocation: Vocation.raider, id: 'raider_thrust',
    description: 'A focused sword thrust that has a high chance of critical damage.'),
  Skill(name: 'Blade Barrier', image: 'blade_barrier.png', vocation: Vocation.raider, id: 'raider_barrier',
    description: 'Create a defensive barrier with your sword, reducing incoming damage.'),
  Skill(name: 'Sword Dance', image: 'sword_dance.png', vocation: Vocation.raider, id: 'raider_dance',
    description: 'A series of rapid sword strikes that increase in damage with each hit.'),
  
  // Mage Skills - Staff-wielding spell caster
  Skill(name: 'Arcane Explosion', image: 'arcane_explosion.png', vocation: Vocation.mage, id: 'mage_explosion',
    description: 'Release a burst of arcane energy, damaging all enemies in a wide area.'),
  Skill(name: 'Frost Nova', image: 'frost_nova.png', vocation: Vocation.mage, id: 'mage_frost',
    description: 'Freeze nearby enemies in place and deal cold damage over time.'),
  Skill(name: 'Mana Shield', image: 'mana_shield.png', vocation: Vocation.mage, id: 'mage_shield',
    description: 'Convert incoming damage to mana cost instead of health loss.'),
  Skill(name: 'Teleport', image: 'teleport.png', vocation: Vocation.mage, id: 'mage_teleport',
    description: 'Instantly teleport to a nearby location, escaping danger.'),

  // Warrior Skills - Axe-wielding tank
  Skill(name: 'Berserker Rage', image: 'berserker_rage.png', vocation: Vocation.warrior, id: 'warrior_rage',
    description: 'Enter a rage state, increasing attack power but reducing defense.'),
  Skill(name: 'Ground Slam', image: 'ground_slam.png', vocation: Vocation.warrior, id: 'warrior_slam',
    description: 'Slam your axe into the ground, stunning nearby enemies.'),
  Skill(name: 'Intimidating Roar', image: 'intimidating_roar.png', vocation: Vocation.warrior, id: 'warrior_roar',
    description: 'Let out a fearsome roar that reduces enemy attack power.'),
  Skill(name: 'Cleave', image: 'cleave.png', vocation: Vocation.warrior, id: 'warrior_cleave',
    description: 'A powerful axe swing that hits multiple enemies in front of you.'),
  
  // Archer Skills - Bow-wielding ranged attacker
  Skill(name: 'Precision Shot', image: 'precision_shot.png', vocation: Vocation.archer, id: 'archer_precision',
    description: 'A carefully aimed shot that deals high damage to a single target.'),
  Skill(name: 'Volley', image: 'volley.png', vocation: Vocation.archer, id: 'archer_volley',
    description: 'Fire multiple arrows into the air, raining down on enemies in an area.'),
  Skill(name: 'Snare Trap', image: 'snare_trap.png', vocation: Vocation.archer, id: 'archer_trap',
    description: 'Set a trap that roots enemies in place when triggered.'),
  Skill(name: 'Eagle Eye', image: 'eagle_eye.png', vocation: Vocation.archer, id: 'archer_eagle',
    description: 'Increase accuracy and critical hit chance for a short duration.'),
  
  // Healer Skills - Staff-wielding support
  Skill(name: 'Healing Touch', image: 'healing_touch.png', vocation: Vocation.healer, id: 'healer_touch',
    description: 'Restore a significant amount of health to a single ally.'),
  Skill(name: 'Rejuvenation', image: 'rejuvenation.png', vocation: Vocation.healer, id: 'healer_rejuvenation',
    description: 'Apply a healing effect that restores health over time.'),
  Skill(name: 'Protective Aura', image: 'protective_aura.png', vocation: Vocation.healer, id: 'healer_aura',
    description: 'Create an aura that reduces damage taken by nearby allies.'),
  Skill(name: 'Cleanse', image: 'cleanse.png', vocation: Vocation.healer, id: 'healer_cleanse',
    description: 'Remove negative effects from an ally.'),
  
  // Rogue Skills - Dagger-wielding stealth fighter
  Skill(name: 'Backstab', image: 'backstab.png', vocation: Vocation.rogue, id: 'rogue_backstab',
    description: 'Attack an enemy from behind for massive damage.'),
  Skill(name: 'Vanish', image: 'vanish.png', vocation: Vocation.rogue, id: 'rogue_vanish',
    description: 'Become invisible for a short duration, allowing for a surprise attack.'),
  Skill(name: 'Poison Blade', image: 'poison_blade.png', vocation: Vocation.rogue, id: 'rogue_poison',
    description: 'Coat your dagger with poison, causing damage over time with each strike.'),
  Skill(name: 'Evasion', image: 'evasion.png', vocation: Vocation.rogue, id: 'rogue_evasion',
    description: 'Greatly increase your chance to dodge incoming attacks for a short time.'),
];