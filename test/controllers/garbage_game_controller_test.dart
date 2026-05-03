import 'package:chikyu_rescue/controllers/garbage_game_controller.dart';
import 'package:chikyu_rescue/models/garbage_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final items = [
    const GarbageItem(name: 'a', category: 'もえるごみ', description: 'd'),
    const GarbageItem(name: 'b', category: '資源ごみ', description: 'd'),
  ];

  test('正しいカテゴリを選ぶと正解', () {
    final c = GarbageGameController(items);
    expect(c.checkAnswer(c.currentItem, 'もえるごみ'), isTrue);
  });

  test('間違ったカテゴリを選ぶと不正解', () {
    final c = GarbageGameController(items);
    expect(c.checkAnswer(c.currentItem, '危険ごみ'), isFalse);
  });

  test('正解数が加算される', () {
    final c = GarbageGameController(items);
    c.checkAnswer(c.currentItem, 'もえるごみ');
    expect(c.score, 1);
  });

  test('次の問題に進める', () {
    final c = GarbageGameController(items);
    expect(c.nextQuestion(), isTrue);
    expect(c.currentItem.name, 'b');
  });
}
