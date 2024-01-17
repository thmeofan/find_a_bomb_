import 'package:find_a_bomb/views/consts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/heart_widget.dart';
import '../../app/widgets/navigation_button.dart';

import '../widget/level_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;
  List<bool>? levelsPlayed;

  _HomeScreenState() {
    levelsPlayed = List.generate(5, (_) => false);
  }

  @override
  void initState() {
    super.initState();
    _loadPlayedLevels();
  }

  Future<void> _loadPlayedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      levelsPlayed = List.generate(numberOfLevels,
          (index) => prefs.getBool('levelPlayed$index') ?? false);
    });
  }

  Future<void> _savePlayedLevel(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('levelPlayed$levelIndex', true);
  }

  void _onStartLevel() {
    if (levelsPlayed == null) {
      return;
    }
    if (life >= 1) {
      Navigator.of(context).pushNamed(AppRoutes.ready);
      setState(() {
        levelsPlayed![selectedLevelIndex] = true;
      });
      _savePlayedLevel(selectedLevelIndex);
      score -= 10;
      life -= 1;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Sorry, you\'re out of lives',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFEAAD82),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 150),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.darkRedColor.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(children: [
          Positioned(
            top: screenHeight * 0.6,
            left: screenWidth * 0.02,
            child: LevelButton(
              isSelected: selectedLevelIndex == 0,
              onTap: () {
                setState(() {
                  selectedLevelIndex = 0;
                });
                _onStartLevel();
              },
              text: 'Level 1',
              beenPlayed: levelsPlayed![0],
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            left: screenWidth * 0.22,
            child: LevelButton(
              isSelected: selectedLevelIndex == 1,
              onTap: () {
                setState(() {
                  selectedLevelIndex = 1;
                });
                _onStartLevel();
              },
              text: 'Level 2',
              beenPlayed: levelsPlayed![1],
            ),
          ),
          Positioned(
            top: screenHeight * 0.12,
            left: screenWidth * 0.42,
            child: LevelButton(
              isSelected: selectedLevelIndex == 2,
              onTap: () {
                setState(() {
                  selectedLevelIndex = 2;
                });
                _onStartLevel();
              },
              text: 'Level 3',
              beenPlayed: levelsPlayed![2],
            ),
          ),
          Positioned(
            top: screenHeight * 0.38,
            left: screenWidth * 0.62,
            child: LevelButton(
              isSelected: selectedLevelIndex == 3,
              onTap: () {
                setState(() {
                  selectedLevelIndex = 3;
                });
                _onStartLevel();
              },
              text: 'Level 4',
              beenPlayed: levelsPlayed![3],
            ),
          ),
          Positioned(
            top: screenHeight * 0.6,
            left: screenWidth * 0.82,
            child: LevelButton(
              isSelected: selectedLevelIndex == 4,
              onTap: () {
                setState(() {
                  selectedLevelIndex = 4;
                });
                _onStartLevel();
              },
              text: 'Level 5',
              beenPlayed: levelsPlayed![4],
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            left: screenWidth * 0.025,
            child: NavigationButton(
              assetName: 'assets/icons/settings.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.settingsScreen,
                );
              },
              buttonWidth: screenWidth * 0.05,
            ),
          ),
          Positioned(
            top: screenHeight * 0.1,
            right: screenWidth * 0.02,
            child: HeartWidget(),
          ),
        ]),
      ),
    );
  }
}
