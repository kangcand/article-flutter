import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uas/app/data/models/article_model.dart';

import '../../../data/service/api_service.dart';


class HomeController extends GetxController with StateMixin {
  List<Article> article = [];
  Set<String> category = {};

  final refreshController = RefreshController();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void refreshData() async {
    refreshController.requestRefresh();
    fetchData();
    refreshController.refreshCompleted();
  }

  void fetchData() async {
    change("loading", status: RxStatus.loading());

    article = await ArticleService.getAll();
    parsingData(article);

    change("success", status: RxStatus.success());
  }

  void parsingData(List<Article> article) {
    category = article.map((e) => e.category).toSet();
  }
}
