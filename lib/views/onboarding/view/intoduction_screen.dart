import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroke_text/stroke_text.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../util/app_routes.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_text_style/onboarding_style.dart';
import '../widget/start_game_widget.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //size=
    return Material(
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.darkRedColor.withOpacity(0.4),
                BlendMode.darken,
              ),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.35,
                  ),
                  child: StrokeText(
                    strokeWidth: 4,
                    strokeColor: AppColors.redColor,
                    text: 'Find the Bomb',
                    textStyle: OnboardingTextStyle.introduction,
                  ),
                ),
                Spacer(),
                StartGameButton(
                  onTap: () {
                    context.read<OnboardingCubit>().setFirstTime();
                    Navigator.pushReplacementNamed(
                        context, AppRoutes.onboarding);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          )),
    );
  }
}
