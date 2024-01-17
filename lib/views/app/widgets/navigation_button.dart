import 'package:flutter/material.dart';


class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {Key? key,
      required this.assetName,
      required this.onTap,
      required this.buttonWidth})
      : super(key: key);
  final String assetName;
  final Function() onTap;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: buttonWidth,
          height: buttonWidth,
          child: Image(
            image: AssetImage(assetName),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
