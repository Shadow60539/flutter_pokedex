import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';

class PokeballBackground extends StatelessWidget {
  static const double _pokeballWidthFraction = 0.664;

  final Widget child;
  final Widget floatingActionButton;

  const PokeballBackground({
    Key key,
    this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final pokeballSize = MediaQuery.of(context).size.width * _pokeballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = 8.0;
    final iconSize = IconTheme.of(context).size;

    final pokeballTopMargin = -(pokeballSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeballSize / 2 - iconButtonPadding - iconSize / 2);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: pokeballTopMargin,
            right: pokeballRightMargin,
            child: Image(
              image: AppImages.pokeball,
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.black.withOpacity(0.05),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
