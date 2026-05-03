class QuizQuestion {
  final String question;
  final List<String> choices;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.question,
    required this.choices,
    required this.correctIndex,
    required this.explanation,
  });

  factory QuizQuestion.fromJson(Map<String, dynamic> json) {
    return QuizQuestion(
      question: json['question'] as String,
      choices: (json['choices'] as List<dynamic>).cast<String>(),
      correctIndex: json['correctIndex'] as int,
      explanation: json['explanation'] as String,
    );
  }
}
