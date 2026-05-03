import 'package:chikyu_rescue/controllers/garbage_game_controller.dart';
import 'package:chikyu_rescue/models/garbage_item.dart';
import 'package:chikyu_rescue/services/data_service.dart';
import 'package:flutter/material.dart';

class GarbageGameScreen extends StatefulWidget {
  final DataService? dataService;
  final List<GarbageItem>? initialItems;
  const GarbageGameScreen({super.key, this.dataService, this.initialItems});

  @override
  State<GarbageGameScreen> createState() => _GarbageGameScreenState();
}

class _GarbageGameScreenState extends State<GarbageGameScreen> {
  GarbageGameController? controller;
  String? result;

  static const categories = ['もえるごみ', 'もえないごみ', '資源ごみ', '危険ごみ'];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final items = widget.initialItems ??
        await (widget.dataService ?? DataService()).loadGarbageItems();
    setState(() => controller = GarbageGameController(items));
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    final item = controller!.currentItem;
    return Scaffold(
      appBar: AppBar(title: const Text('ごみぶんべつげーむ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('なまえ: ${item.name}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: categories
                  .map((c) => ElevatedButton(
                        onPressed: () {
                          final ok = controller!.checkAnswer(item, c);
                          setState(() => result = ok ? 'せいかい！' : 'ざんねん');
                        },
                        child: Text(c),
                      ))
                  .toList(),
            ),
            if (result != null) ...[
              const SizedBox(height: 12),
              Text(result!, style: const TextStyle(fontSize: 22)),
              Text(item.description),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    controller!.nextQuestion();
                    result = null;
                  });
                },
                child: const Text('つぎへ'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
