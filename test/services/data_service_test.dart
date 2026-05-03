import 'dart:convert';
import 'dart:typed_data';

import 'package:chikyu_rescue/services/data_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeBundle extends CachingAssetBundle {
  final Map<String, String> data;
  FakeBundle(this.data);

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return data[key]!;
  }

  @override
  Future<ByteData> load(String key) async {
    return ByteData.view(Uint8List.fromList(utf8.encode(data[key]!)).buffer);
  }
}

void main() {
  test('loadGarbageItems', () async {
    final service = DataService(
      bundle: FakeBundle({
        'assets/data/garbage_items.json':
            '[{"name":"a","category":"もえるごみ","description":"d"}]',
      }),
    );
    final items = await service.loadGarbageItems();
    expect(items.first.name, 'a');
  });

  test('loadQuizQuestions', () async {
    final service = DataService(
      bundle: FakeBundle({
        'assets/data/quiz_questions.json':
            '[{"question":"q","choices":["a","b","c"],"correctIndex":2,"explanation":"e"}]',
      }),
    );
    final items = await service.loadQuizQuestions();
    expect(items.first.correctIndex, 2);
  });

  test('loadEncyclopediaItems', () async {
    final service = DataService(
      bundle: FakeBundle({
        'assets/data/encyclopedia_items.json':
            '[{"title":"t","description":"d","imagePath":null}]',
      }),
    );
    final items = await service.loadEncyclopediaItems();
    expect(items.first.title, 't');
  });
}
