import 'package:flutter/material.dart';

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key, 
    required this.iconData,
    required this.backgroundColor, 
    required this.size, 
    required this.iconSize, 
    this.onPressed, 
  });

  final IconData iconData;
  final Color backgroundColor;
  final double size;
  final double iconSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  size,
      height: size,
      decoration: _buildDecoration( backgroundColor ),
      child: IconButton(
        onPressed: onPressed, 
        icon: Icon( iconData, size: iconSize, )),
    );
  }
// -----------------------------------------------------
  BoxDecoration _buildDecoration( Color color ) =>  BoxDecoration(
    color: color,
    shape: BoxShape.circle
  );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~