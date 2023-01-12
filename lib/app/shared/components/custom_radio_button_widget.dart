import 'package:flutter/material.dart';

import '../utils.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String text;
  final Color selectedColor;
  final Color borderColor;
  final double? borderThickness;
  final TextStyle? textStyle;
  final ValueChanged<T?> onChanged;
  final double? height;
  final double? width;

  const CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.text,
    this.selectedColor = PodiColors.green,
    this.borderColor = PodiColors.dark,
    this.textStyle,
    this.height,
    this.width,
    this.borderThickness,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: _customRadioButton,
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : PodiColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isSelected ? selectedColor : borderColor,
          width: borderThickness ?? 2,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle ??
              PodiTexts.caption.size(11).heightCenter.weightSemibold.withColor(
                    isSelected ? PodiColors.white : PodiColors.dark,
                  ),
        ),
      ),
    );
  }
}
