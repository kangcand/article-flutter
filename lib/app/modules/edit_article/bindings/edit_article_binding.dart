import 'package:get/get.dart';

import '../controllers/edit_article_controller.dart';

class EditArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditArticleController>(
      () => EditArticleController(),
    );
  }
}
