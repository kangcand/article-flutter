import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:uas/app/routes/app_pages.dart';

import '../../../helpers/size_helper.dart';
import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  DetailArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => Get.toNamed(
              Routes.EDIT_ARTICLE,
              arguments: controller.article,
            ),
            child: const Text('EDIT'),
          ),
          TextButton(
            onPressed: () => controller.handleDelete(context),
            child: const Text(
              'DELETE',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: TextButton(
      //     onPressed: () => Get.toNamed(
      //       Routes.EDIT_ARTICLE,
      //       arguments: controller.article,
      //     ),
      //     child: const Text('EDIT'),
      //   ),
      // ),
      body: Container(
        height: displayHeight(context) * 1,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(controller.article.cover),
                  ),
                ),
                // const Divider(
                //   thickness: 5,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    controller.article.title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Kategori: ${controller.article.category.capitalize} - ${controller.article.date}',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.article.description,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
