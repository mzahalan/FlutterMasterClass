import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  //tween (between) transition between values
  late Animation _sizeAnimation;


  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200), 
      vsync: this,
    );

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem<double>(tween: Tween<double>(begin: 25, end: 50), weight: 50),
        TweenSequenceItem<double>(tween: Tween<double>(begin: 50, end: 25), weight: 50),
      ]
    ).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return IconButton(
          onPressed: (){
            widget.character.toggleIsFav();
            _controller.reset();
            _controller.forward();
          }, 
          icon: Icon(
            Icons.favorite, 
            color: widget.character.isFav? AppColors.primaryColor : Colors.grey[800],
            size: _sizeAnimation.value,
          ),
        );
      }, animation: _controller,
    );
  }
}