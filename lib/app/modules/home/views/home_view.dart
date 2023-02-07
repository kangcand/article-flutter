import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas/app/helpers/size_helper.dart';
import 'package:uas/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  List<Widget> listArticle() {
    return controller.category.map((category) {
      final filteredArticle = controller.article
          .where((article) => article.category == category)
          .toList();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 5,
                    color: Colors.white,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  category.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 220,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: filteredArticle
                    .map(
                      (article) => GestureDetector(
                        onTap: () => Get.toNamed(
                          Routes.DETAIL_ARTICLE,
                          arguments: article,
                        ),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          height: 1 * 0.25,
                          width: 380,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(
                              10), //You can use EdgeInsets like above
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("${article.cover}"),
                                fit: BoxFit.cover),
                          ),
                          child: Text(
                            "${article.title}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),
        centerTitle: true,
        // actions: [
        //   TextButton(
        //     onPressed: () => Get.toNamed(Routes.ADD_ARTICLE),
        //     child: const Text('Add Article'),
        //   )
        // ],
      ),
      body: controller.obx(
        (state) => SmartRefresher(
          controller: controller.refreshController,
          onRefresh: controller.refreshData,
          child: SingleChildScrollView(
            child: Container(
              // height: displayHeight(context) * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: listArticle(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.toNamed(Routes.ADD_ARTICLE),
        child: const Text('+'),
      ),
    );
  }
}
