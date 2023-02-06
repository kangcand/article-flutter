import 'package:get/get.dart';

import 'package:uas/app/modules/add_article/bindings/add_article_binding.dart';
import 'package:uas/app/modules/add_article/views/add_article_view.dart';
import 'package:uas/app/modules/detail_article/bindings/detail_article_binding.dart';
import 'package:uas/app/modules/detail_article/views/detail_article_view.dart';
import 'package:uas/app/modules/edit_article/bindings/edit_article_binding.dart';
import 'package:uas/app/modules/edit_article/views/edit_article_view.dart';
import 'package:uas/app/modules/home/bindings/home_binding.dart';
import 'package:uas/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ARTICLE,
      page: () => AddArticleView(),
      binding: AddArticleBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => DetailArticleView(),
      binding: DetailArticleBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ARTICLE,
      page: () => EditArticleView(),
      binding: EditArticleBinding(),
    ),
  ];
}
