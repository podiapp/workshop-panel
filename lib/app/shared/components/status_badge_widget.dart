import 'package:flutter/material.dart';
import '../utils.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final double? height;
  final double? width;
  final bool centerText;
  const StatusBadge({
    required this.text,
    required this.color,
    required this.backgroundColor,
    this.height,
    this.width,
    this.centerText = false,
    Key? key,
  }) : super(key: key);

  Text get _text => Text(
        text.toUpperCase(),
        style: PodiTexts.button2.withColor(color),
        maxLines: 1,
        overflow: TextOverflow.fade,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: centerText ? 0 : 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),
      child: centerText ? Center(child: _text) : _text,
    );
  }
}
