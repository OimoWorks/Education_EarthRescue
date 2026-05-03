import 'package:chikyu_rescue/models/quiz_question.dart';

class QuizController {
  final List<QuizQuestion> questions;
  int currentIndex = 0;

  QuizController(this.questions);

  QuizQuestion get currentQuestion => questions[currentIndex];

  bool checkAnswer(QuizQuestion question, int selectedIndex) {
    return question.correctIndex == selectedIndex;
  }

  String explanationOf(QuizQuestion question) => question.explanation;

  bool nextQuestion() {
    if (currentIndex < questions.length - 1) {
      currentIndex++;
      return true;
    }
    return false;
  }
}
