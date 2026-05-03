import 'package:chikyu_rescue/screens/encyclopedia_screen.dart';
import 'package:chikyu_rescue/screens/garbage_game_screen.dart';
import 'package:chikyu_rescue/screens/quiz_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ちきゅうれすきゅー')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const GarbageGameScreen())), child: const Text('ごみぶんべつげーむ')),
          ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const QuizScreen())), child: const Text('えこくいず')),
          ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>const EncyclopediaScreen())), child: const Text('ずかん')),
        ]),
      ),
    );
  }
}
