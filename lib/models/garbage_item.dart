class GarbageItem {
  final String name;
  final String category;
  final String description;

  const GarbageItem({
    required this.name,
    required this.category,
    required this.description,
  });

  factory GarbageItem.fromJson(Map<String, dynamic> json) {
    return GarbageItem(
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
    );
  }
}
