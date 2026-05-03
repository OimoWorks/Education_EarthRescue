import 'package:chikyu_rescue/models/garbage_item.dart';
import 'package:chikyu_rescue/screens/garbage_game_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ゴミ名とカテゴリボタン表示、正誤表示', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GarbageGameScreen(
        initialItems: [GarbageItem(name: 'でんち', category: '危険ごみ', description: 'ぶんべつしてね')],
      ),
    ));
    await tester.pumpAndSettle();

    expect(find.textContaining('でんち'), findsOneWidget);
    expect(find.text('もえるごみ'), findsOneWidget);
    expect(find.text('危険ごみ'), findsOneWidget);

    await tester.tap(find.text('危険ごみ'));
    await tester.pump();
    expect(find.text('せいかい！'), findsOneWidget);

    await tester.tap(find.text('もえるごみ'));
    await tester.pump();
    expect(find.text('ざんねん'), findsNothing);
  });

  testWidgets('不正解時にざんねん', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: GarbageGameScreen(
        initialItems: [GarbageItem(name: 'でんち', category: '危険ごみ', description: 'ぶんべつしてね')],
      ),
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.text('もえるごみ'));
    await tester.pump();
    expect(find.text('ざんねん'), findsOneWidget);
  });
}
