import 'package:chikyu_rescue/services/data_service.dart';
import 'package:flutter/material.dart';

class EncyclopediaScreen extends StatelessWidget {
  const EncyclopediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ずかん')),
      body: FutureBuilder(
        future: DataService().loadEncyclopediaItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final items = snapshot.data!;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                child: ListTile(
                  leading: item.imagePath == null
                      ? const Icon(Icons.image_not_supported)
                      : Image.asset(item.imagePath!),
                  title: Text(item.title),
                  subtitle: Text(item.description),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
