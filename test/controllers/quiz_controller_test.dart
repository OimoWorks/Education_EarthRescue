import 'package:chikyu_rescue/controllers/quiz_controller.dart';
import 'package:chikyu_rescue/models/quiz_question.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final questions = [
    const QuizQuestion(
      question: 'q1',
      choices: ['a', 'b', 'c'],
      correctIndex: 1,
      explanation: 'exp1',
    ),
    const QuizQuestion(
      question: 'q2',
      choices: ['a', 'b', 'c'],
      correctIndex: 2,
      explanation: 'exp2',
    ),
  ];

  test('正しい選択肢で正解', () {
    final c = QuizController(questions);
    expect(c.checkAnswer(c.currentQuestion, 1), isTrue);
  });

  test('間違った選択肢で不正解', () {
    final c = QuizController(questions);
    expect(c.checkAnswer(c.currentQuestion, 0), isFalse);
  });

  test('解説文が取得できる', () {
    final c = QuizController(questions);
    expect(c.explanationOf(c.currentQuestion), 'exp1');
  });

  test('次の問題に進める', () {
    final c = QuizController(questions);
    expect(c.nextQuestion(), isTrue);
    expect(c.currentQuestion.question, 'q2');
  });
}
