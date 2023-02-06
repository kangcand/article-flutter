import 'package:get/get.dart';
import 'package:uas/app/data/models/article_model.dart';

class ArticleService {
  static const base = "https://article-api-psi.vercel.app";
  static final connector = GetConnect();

  static Future<List<Article>> getAll() async {
    final request = await connector.get('$base/Articles');
    final response = request.body["data"] as List;

    return response.map((e) => Article.fromJson(e)).toList();
  }

  static Future<void> addNewArticle(Article article) async {
    final request =
        await connector.post('$base/article', Article.toJson(article));
    if (!request.isOk) print(request.body);
  }

  static Future<void> editArticle(Article article) async {
    final request = await connector.patch(
        '$base/article/${article.id}', Article.toJson(article));

    if (!request.isOk) print(request.body);
  }

  static Future<void> deleteArticle(Article article) async {
    final request = await connector.delete('$base/article/${article.id}');

    if (!request.isOk) print(request.body);
  }
}
