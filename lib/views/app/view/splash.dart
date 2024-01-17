import 'package:find_a_bomb/views/consts/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/repository/onboarding_repo.dart';
import '../../../util/app_routes.dart';
import '../widgets/moving_icon_progress_indicator.dart';

class SplashScreen extends StatefulWidget {
  final OnboardingRepository onboardingRepository;
  final String homeRoute;
  final String onboardingRoute;

  const SplashScreen({
    Key? key,
    required this.homeRoute,
    required this.onboardingRepository,
    required this.onboardingRoute,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateProgress();
  }

  void _simulateProgress() {
    Future.delayed(const Duration(milliseconds: 60), () {
      if (progress < 1.0) {
        setState(() {
          progress += 0.01;
          if (progress > 1.0) {
            progress = 1.0;
          }
        });
        _simulateProgress();
      } else {
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() async {
    bool isFirstLaunch = await widget.onboardingRepository.checkFirstTime();
    if (isFirstLaunch) {
      await widget.onboardingRepository.setFirstTime();
      Navigator.of(context).pushReplacementNamed(AppRoutes.introduction);
    } else {
      Navigator.of(context).pushReplacementNamed(widget.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AppColors.darkRedColor.withOpacity(0.8),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              IconMovingProgressIndicator(
                progress: progress,
                backgroundColor: AppColors.orangeColor.withOpacity(0.5),
                valueColor: AppColors.orangeColor,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
