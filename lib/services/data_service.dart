import 'dart:convert';

import 'package:chikyu_rescue/models/encyclopedia_item.dart';
import 'package:chikyu_rescue/models/garbage_item.dart';
import 'package:chikyu_rescue/models/quiz_question.dart';
import 'package:flutter/services.dart';

class DataService {
  final AssetBundle bundle;
  DataService({AssetBundle? bundle}) : bundle = bundle ?? rootBundle;

  Future<List<GarbageItem>> loadGarbageItems() async {
    final jsonString = await bundle.loadString('assets/data/garbage_items.json');
    final list = jsonDecode(jsonString) as List<dynamic>;
    return list
        .map((e) => GarbageItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<QuizQuestion>> loadQuizQuestions() async {
    final jsonString = await bundle.loadString('assets/data/quiz_questions.json');
    final list = jsonDecode(jsonString) as List<dynamic>;
    return list
        .map((e) => QuizQuestion.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<EncyclopediaItem>> loadEncyclopediaItems() async {
    final jsonString = await bundle.loadString('assets/data/encyclopedia_items.json');
    final list = jsonDecode(jsonString) as List<dynamic>;
    return list
        .map((e) => EncyclopediaItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
