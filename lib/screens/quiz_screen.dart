import 'package:chikyu_rescue/controllers/quiz_controller.dart';
import 'package:chikyu_rescue/models/quiz_question.dart';
import 'package:chikyu_rescue/services/data_service.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizController? controller;
  String? result;
  @override
  void initState() { super.initState(); _load(); }
  Future<void> _load() async {
    final list = await DataService().loadQuizQuestions();
    setState(() => controller = QuizController(list));
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final q = controller!.currentQuestion;
    return Scaffold(
      appBar: AppBar(title: const Text('えこくいず')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(q.question, style: const TextStyle(fontSize: 22)),
          ...List.generate(q.choices.length, (i) => ElevatedButton(onPressed: () {
            final ok = controller!.checkAnswer(q, i);
            setState(() => result = '${ok ? 'せいかい！' : 'ざんねん'}\n${q.explanation}');
          }, child: Text(q.choices[i]))),
          if (result != null) Text(result!),
          ElevatedButton(onPressed: () { setState(() {controller!.nextQuestion(); result = null;}); }, child: const Text('つぎへ'))
        ]),
      ),
    );
  }
}
