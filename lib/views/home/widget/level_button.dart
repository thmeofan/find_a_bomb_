import 'package:find_a_bomb/views/consts/app_text_style/menu_style.dart';
import 'package:flutter/material.dart';

import 'package:stroke_text/stroke_text.dart';

import '../../consts/app_colors.dart';

class LevelButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final bool beenPlayed;

  const LevelButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.isSelected,
    required this.beenPlayed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.165,
        height: MediaQuery.of(context).size.width * 0.14,
        // padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(beenPlayed
                ? 'assets/images/red_fire.png'
                : 'assets/images/blue_fire.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.05,
            ),
            child: StrokeText(
              text: text,
              strokeWidth: 4,
              strokeColor: AppColors.redColor,
              textStyle: MenuTextStyle.lvlStyle,
            ),
          ),
        ),
      ),
    );
  }
}
