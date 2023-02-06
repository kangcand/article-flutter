class Article {
  int id;
  String title;
  String category;
  String date;
  String description;
  String cover;

  Article({
    required this.cover,
    required this.category,
    required this.description,
    required this.id,
    required this.date,
    required this.title,
  });

  static Map<String, dynamic> toJson(Article article) {
    return {
      "title": article.title,
      "category": article.category,
      "date": article.date,
      "description": article.description,
      "cover": article.cover,
    };
  }

  static Article fromJson(Map<String, dynamic> json) {
    return Article(
        cover: json["cover"],
        category: json["category"],
        description: json["description"],
        id: json["id"],
        date: json["date"],
        title: json["title"]);
  }
}
