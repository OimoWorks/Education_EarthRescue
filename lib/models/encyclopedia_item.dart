class EncyclopediaItem {
  final String title;
  final String description;
  final String? imagePath;

  const EncyclopediaItem({
    required this.title,
    required this.description,
    this.imagePath,
  });

  factory EncyclopediaItem.fromJson(Map<String, dynamic> json) {
    return EncyclopediaItem(
      title: json['title'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String?,
    );
  }
}
