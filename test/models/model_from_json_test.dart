import 'package:chikyu_rescue/models/encyclopedia_item.dart';
import 'package:chikyu_rescue/models/garbage_item.dart';
import 'package:chikyu_rescue/models/quiz_question.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GarbageItem.fromJson', () {
    final item = GarbageItem.fromJson({
      'name': 'ぺっとぼとる',
      'category': '資源ごみ',
      'description': 'あらってだそう',
    });

    expect(item.name, 'ぺっとぼとる');
    expect(item.category, '資源ごみ');
    expect(item.description, 'あらってだそう');
  });

  test('QuizQuestion.fromJson', () {
    final q = QuizQuestion.fromJson({
      'question': 'みずをだしっぱなしにしていい？',
      'choices': ['いい', 'だめ', 'どちらでも'],
      'correctIndex': 1,
      'explanation': 'みずはたいせつだよ',
    });

    expect(q.question, 'みずをだしっぱなしにしていい？');
    expect(q.choices.length, 3);
    expect(q.correctIndex, 1);
    expect(q.explanation, 'みずはたいせつだよ');
  });

  test('EncyclopediaItem.fromJson', () {
    final e = EncyclopediaItem.fromJson({
      'title': 'たいようこう',
      'description': 'たいようのひかりででんきをつくる',
      'imagePath': null,
    });

    expect(e.title, 'たいようこう');
    expect(e.description, 'たいようのひかりででんきをつくる');
    expect(e.imagePath, isNull);
  });
}
