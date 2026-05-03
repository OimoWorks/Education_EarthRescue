import 'package:chikyu_rescue/models/garbage_item.dart';

class GarbageGameController {
  final List<GarbageItem> items;
  int currentIndex = 0;
  int score = 0;

  GarbageGameController(this.items);

  GarbageItem get currentItem => items[currentIndex];

  bool checkAnswer(GarbageItem item, String selectedCategory) {
    final correct = item.category == selectedCategory;
    if (correct) score++;
    return correct;
  }

  bool nextQuestion() {
    if (currentIndex < items.length - 1) {
      currentIndex++;
      return true;
    }
    return false;
  }
}
