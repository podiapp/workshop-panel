import 'package:flutter/material.dart';
import 'package:workshop_web/app/shared/utils.dart';

class DrawerWidget extends StatelessWidget {
  final double _width = 240;
  final double _height = double.infinity;

  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      color: Colors.black,
      child: Center(
        child: Text(
          "Cadê?",
          style: PodiTexts.body1.withColor(PodiColors.white),
        ),
      ),
    );
  }
}
