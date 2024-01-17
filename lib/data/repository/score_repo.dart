import 'package:shared_preferences/shared_preferences.dart';

// class ScoreRepository {
//   static const String _scoreKey = 'score';
//   static const String _lifeKey = 'life';
//
//   Future<int> getScore() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_scoreKey) ?? 0;
//   }
//
//   Future<void> setScore(int score) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_scoreKey, score);
//   }
//
//   Future<int> getLife() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt(_lifeKey) ?? 10;
//   }
//
//   Future<void> setLife(int life) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt(_lifeKey, life);
//   }
//
//   Future<void> decrementLife() async {
//     int currentLife = await getLife();
//     if (currentLife > 0) {
//       await setLife(currentLife - 1);
//     }
//   }
//
//   Future<void> incrementScore(int points) async {
//     int currentScore = await getScore();
//     await setScore(currentScore + points);
//   }
//
//   Future<void> decrementScore(int points) async {
//     int currentScore = await getScore();
//     await setScore(currentScore - points);
//   }
// }

int score = 0;
int life = 10;
